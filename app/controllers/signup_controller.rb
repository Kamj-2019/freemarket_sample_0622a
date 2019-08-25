class SignupController < ApplicationController

  def step1
    @user = User.new
    @user_detail = UserDetail.new
  end

  def step2

    @user = User.new
    @user_detail = UserDetail.new

    # session[:nickname] = user_params[:nickname]
    # session[:email] = user_params[:email]
    # session[:password] = user_params[:password] 
    # session[:password_confirmation] = user_params[:password_confirmation]

    # session[:first_name] = user_detail_params[:first_name]
    # session[:family_name] = user_detail_params[:family_name]
    # session[:kana_first_name] = user_detail_params[:kana_first_name]
    # session[:kana_family_name] = user_detail_params[:kana_family_name]
    # session[:birthday] = user_derail_params[:birthday]


  end

  def step3
    @user = User.new
    @user_detail = UserDetail.new
  end


  # private

  #   def user_params
  #     params.require(:user).permit(
  #       :nickname, 
  #       :email, 
  #       :password, 
  #       :password_confirmation,
  #     )
  #   end

  #   def user_detail_params
  #     params.require(:user_detail).permit(
  #       :first_name,
  #       :family_name,
  #       :kana_first_name,
  #       :kana_family_name,
  #       :birthday,
  #       :postalcode,
  #       :prefecture_id,
  #       :city,
  #       :address,
  #       :building,
  #       :phone_number,
  #       :user_id
  #       )
  #   end



end
