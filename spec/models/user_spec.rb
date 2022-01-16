require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: "joebob", email: "joebob@sample.com", password: "joelovescoding" )}
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without a username" do
    subject.username=nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the username is less than 2 chars" do
    subject.username="ab"
    expect(subject).to_not be_valid
  end 

  it "is not valid if the username is more than 10 chars" do
    subject.username="abcdef1234567"
    expect(subject).to_not be_valid
  end 

  it "is not valid if the email address doesn't have a @" do
    subject.email="bobbyATyahoo.com"
    expect(subject).to_not be_valid
  end 
 
end
