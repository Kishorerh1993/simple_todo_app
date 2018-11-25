require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with email and password" do 
    user = User.new(:email => "testuser@example.com", :password=>"123456")
    expect(user).to be_valid
  end
  it "is invalid without email address" do 
    user = User.new(:password=>"123456")
    expect(user).to be_invalid
  end
  it "is invalid with password less than 6 char" do 
    user = User.new(:email => "testuserpassword@example.com", :password=>"12345")
    expect(user).to be_invalid
  end
  it "is invalid with duplicate email address" do 
    User.create(:email => "duplicate@example.com", :password=>"123456")
    user = User.new(:email => "duplicate@example.com", :password=>"123456")
    expect(user).to be_invalid
  end
end
