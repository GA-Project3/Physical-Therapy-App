class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  # private

  # def user 
  #   @user = Doctor.find_by_email(user[:email])
  #   if @user != nil
  #     @user = Doctor.confirm(user)
  #     @user_t = "doctors"
  #   else
  #     @user = Patient.confirm(user)
  #     @user_t = "patients"
  #   end
  # end

  # def admin_user 
  #   @admin_user = User.find_by(first_name:"Admin",last_name:"User")
  # end

  # def require_login
  #   if !current_user
  #     redirect_to '/signin'
  #   end
  # end

  # helper_method :current_user

end
