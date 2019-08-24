class SignupController < ApplicationController

  def step1
    @user = User.new
    @user_detail = UserDetail.new
  end

end
