require 'rails_helper'

RSpec.describe Patient, type: :model do
  before(:each) do

  @patient = Patient.create!(first_name: "TestF", last_name: "TestL", email: "example@email.com", password: "asdfasdf", location: "123 main street San Francisco, California 94109", phone: "415-368-6789", description: "blah blah blah", image_url: "coolphoto.jpg")
  end

  describe "creation" do
    it "should have one item created, after being created" do
      expect(Patient.all.count).to eq(1)
    end
  end

  describe "validations" do
    it "should not let a patient be created without an email address" do
      @patient.email = nil
        expect(@patient).to_not be_valid
    end

     it "should not let a user be created with a valid password" do
      @patient.password = nil
        expect(@patient).to_not be_valid
     end

     it "should not allow description to be empty" do
      @patient.description = nil
        expect(@patient).to_not be_valid
     end

     it "should require phone number to be present" do
      @patient.phone = nil
        expect(@patient).to_not be_valid
     end

  end
  describe "length validations" do
    it "should not allow a password to be greater than 12 characters" do
      @patient.password = "j" * 51
      expect(@patient).to_not be_valid
    end

    it "should not allow a patient's first name to to be greater than 22 characters" do
      @patient.first_name = "j" * 23
      expect(@patient).to_not be_valid
    end

     it "should not allow a patient's last name to to be greater than 22 characters" do
      @patient.last_name = "j" * 23
      expect(@patient).to_not be_valid
    end
  end
end
