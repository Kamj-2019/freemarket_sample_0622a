class SignupController < ApplicationController
  before_action :save_to_session, only: :step2

  def step1
    # インスタンスの生成
    @user = User.new
    @user.build_user_detail # user_detailモデルと関連付ける

  end

  def step2

    # step1会員情報入力をsession保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password] 
    session[:password_confirmation] = user_params[:password_confirmation]
    # 以下はuser_detailsテーブルの情報
    session[:first_name] = user_detail_attributes_params[:first_name]
    session[:family_name] = user_detail_attributes_params[:family_name]
    session[:kana_first_name] =  user_detail_attributes_params[:kana_first_name]
    session[:kana_family_name] =  user_detail_attributes_params[:kana_family_name]
    session[:birthday] =  user_detail_attributes_params[:birthday]

    @user = User.new
    @user.build_user_detail # user_detailモデルと関連付ける

  end

  def step3
    # step2電話番号の確認をsession保存
    session[:phone_number] = user_detail_attributes_params[:phone_number]

    @user = User.new
    @user.build_user_detail # user_detailモデルと関連付ける

  end

  def step4
    # step3住所入力をsession保存
    session[:postalcode] = user_detail_attributes_params[:postalcode]
    session[:prefecture_id] = user_detail_attributes_params[:prefecture_id]
    session[:city] = user_detail_attributes_params[:city]
    session[:address] = user_detail_attributes_params[:address]
    session[:building] = user_detail_attributes_params[:building]

    @user = User.new
    @user.build_user_detail # user_detailモデルと関連付ける

  end

  def save_to_session
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password] 
    session[:password_confirmation] = user_params[:password_confirmation]

    # バリデーションをかけるため、仮でインスタンスに入力値を入れる
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    # インスタンスにバリデーションをかけ、通らなければ1step目のページを再度表示する
    unless @user.valid?
      render '/signup/step1'
    end

  end

  def create

    User.create(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    user = User.find_by(email: session[:email])
    UserDetail.create(
       user_id: user.id,
       first_name: session[:first_name],
       family_name: session[:family_name],
       kana_first_name: session[:kana_first_name],
       kana_family_name: session[:kana_family_name],
       birthday: session[:birthday],
       postalcode: session[:postalcode],
       prefecture_id: session[:prefecture_id],
       city: session[:city],
       address: session[:address],
       building: session[:building],
       phone_number: session[:phone_number])

    if User.create
      redirect_to done_signup_index_path
    else
      redirect_to step0_signup_index_path
    end

  end

  private

    def user_params
      params.require(:user).permit(
        :nickname, 
        :email, 
        :password, 
        :password_confirmation
      )
    end

    def user_detail_attributes_params
      params.require(:user).require(:user_detail_attributes).permit(
        :id,
        :first_name,
        :family_name,
        :kana_first_name,
        :kana_family_name,
        :birthday,
        :postalcode,
        :prefecture_id,
        :city,
        :address,
        :building,
        :phone_number
        )
    end
end
