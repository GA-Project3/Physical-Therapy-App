class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_login
    if !current_user
      flash[:error] = "Please login or create an account!"
      redirect_to '/'
    end
  end

  def is_doctor
    if current_user.user_t == 'doctors'
    else
      flash[:error] = "Only a doctor may view this!"
      redirect_to '/'
    end
  end
  
  def is_patient
    if current_user.user_t == 'patients'
    else
      flash[:error] = "Only a patient may view this!"
      redirect_to '/'
    end
  end

  def patient_profile?
    if current_user.user_t == 'patients'
      if current_user.id.to_s != params[:id]
        flash[:error] = "You are not authorized to view this!"
        redirect_to "/patients/#{current_user.id}"
      end
    end
  end

  def doctor_profile?
    if current_user.id.to_s != params[:id]
      flash[:error] = "Only a doctor may view this!"
      redirect_to "/doctors/#{current_user.id}"
    end
  end


end
  
