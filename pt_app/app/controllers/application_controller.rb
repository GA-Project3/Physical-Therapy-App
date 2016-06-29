class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_login
    if !current_user
      redirect_to '/'
    end
  end

  def is_doctor
    if current_user.user_t == 'doctors'
    else
      redirect_to '/'
    end
  end
  

  def is_patient
    if current_user.user_t == 'patients'
    else
      redirect_to '/'
    end
  end

  def patient_profile?
    if current_user.id.to_s != params[:id]
      redirect_to "/patients/#{current_user.id}"
    end
  end

  def doctor_profile?
    if current_user.id.to_s != params[:id]
      redirect_to "/doctors/#{current_user.id}"
    end
  end

end
  
