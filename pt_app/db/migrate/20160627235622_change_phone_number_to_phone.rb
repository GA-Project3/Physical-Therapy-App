class ChangePhoneNumberToPhone < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.rename :phone_number, :phone
  end
end