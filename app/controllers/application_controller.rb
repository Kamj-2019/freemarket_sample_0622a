class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, user_detail_attributes:[:first_name, :family_name, :kana_first_name, :kana_family_name, :birthday, :phone_number,  :postalcode, :prefecture_id, :city, :address, :building]])
  end
end
