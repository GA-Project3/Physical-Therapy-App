module SessionsHelper

  def login(user, user_t)
    session[:user_id] = user.id
    session[:user_t] = user_t
  
  end

  def user_type
  end

  def current_user
    if session[:user_id] != nil
      if session[:user_t] == "patients"
        @current_user ||= session[:user_id] && Patient.find(session[:user_id])
        @current_user.user_t = "patients"
      else
        @current_user ||= session[:user_id] && Doctor.find(session[:user_id])
        @current_user.user_t = "doctors"
      end
      return @current_user
    end
  end

  def logged_in?
    if @current_user == nil
      redirect_to "/signin"
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_t] = nil
    @current_user = nil
    session.delete(:user_id)
  end

end