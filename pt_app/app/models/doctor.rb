class Doctor < ActiveRecord::Base
  has_many :patients

  def confirm_email

  end
end
