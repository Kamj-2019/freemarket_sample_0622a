class SignupController < ApplicationController

  def step1
    @user = User.new
  end

end
