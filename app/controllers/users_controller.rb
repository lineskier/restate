class UsersController < ApplicationController
  def dashboard
  	@user = current_user
  	@estates = @current_user.estates
  	
  	
  end
end
