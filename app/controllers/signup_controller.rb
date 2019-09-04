class SignupController < ApplicationController
  before_action :save_to_session, only: :step2

  require "payjp"

  def personal
    # インスタンスの生成
    @user = User.new
    @user.build_user_detail # user_detailモデルと関連付ける

  end

  def phone

    # personalでの入力をsession保存
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

  def address
    # phoneでの入力をsession保存
    session[:phone_number] = user_detail_attributes_params[:phone_number]

    @user = User.new
    @user.build_user_detail # user_detailモデルと関連付ける

  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト',
      card: params['payjp-token'],
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to done_signup_index_path
      else
        redirect_to pay_signup_index_path
      end
    end

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
       postalcode: user_detail_attributes_params[:postalcode],
      prefecture_id: user_detail_attributes_params[:prefecture_id],
      city: user_detail_attributes_params[:city],
      address: user_detail_attributes_params[:address],
      building: user_detail_attributes_params[:building],
      phone_number: user_detail_attributes_params[:phone_number])

    if User.create
      sign_in User.find_by(email: session[:email]) unless user_signed_in?
      redirect_to card_signup_index_path
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
