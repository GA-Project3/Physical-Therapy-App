require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before(:each) do

    @doctor = Doctor.create!(first_name: "TestF", last_name: "TestL", email: "example@email.com", password: "asdfasdf", location: "123 main street San Francisco, California 94109", phone: "415-368-6789", description: "blah blah blah", image_url: "coolphoto.jpg")
  end

  describe "creation" do
    it "should have one item created, after being created" do
      expect(Doctor.all.count).to eq(1)
    end
  end

  describe "validations" do
    it "should not let a doctor be created without an email address" do
      @doctor.email = nil
        expect(@doctor).to_not be_valid
    end

     it "should not let a user be created without a valid password" do
      @doctor.password = nil
        expect(@doctor).to_not be_valid
     end

     it "should not allow description to be empty" do
      @doctor.description = nil
        expect(@doctor).to_not be_valid
     end

     it "should require phone number to be present" do
      @doctor.phone = nil
        expect(@doctor).to_not be_valid
     end

     it "should confirm a user :password" do
        doctor = Doctor.new({password: "blah", password_confirmation: "bla"})
        expect(doctor.save).to be(false)
    end

      it "should return false when user password is incorrect" do
        user = User.create({
                            email: "blah@blah.com",
                            email_confirmation: "blah@blah.com",
                            password: "blahBLAH",
                            password_confirmation: "blahBLAH"
                        })
        expect(User.confirm("blah@blah.com", "blahblah")).to be(false)
    end

      it "should confirm a :doctor's email" do
        user = Doctor.new({email: "example2@email.com", email_confirmation: "example@email.com"})
        expect(user.save).to be(false)
    end

  end
  describe "length validations" do
    it "should not allow a password to be greater than 12 characters" do
      @doctor.password = "j" * 51
      expect(@doctor).to_not be_valid
    end

    it "should not allow a doctor's first name to to be greater than 22 characters" do
      @doctor.first_name = "j" * 23
      expect(@doctor).to_not be_valid
    end

     it "should not allow a doctor's last name to to be greater than 22 characters" do
      @doctor.last_name = "j" * 23
      expect(@doctor).to_not be_valid
    end
  end
end


    # t.string   "first_name"
    # t.string   "last_name"
    # t.string   "email"
    # t.string   "password_digest"
    # t.string   "location"
    # t.string   "phone"
    # t.string   "description"
    # t.string   "image_url"
    # t.datetime "created_at",      null: false
    # t.datetime "updated_at",      null: false
