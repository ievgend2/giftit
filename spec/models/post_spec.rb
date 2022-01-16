require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: "Study Guide", description: "Free item in great condition", user: FactoryBot.create(:user), category: FactoryBot.create(:category) )}
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description=nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a user_id" do
    subject.user_id=nil
    expect(subject).to_not be_valid
  end

end
