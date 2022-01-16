require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "get users_path" do
    it "renders the index view" do
      FactoryBot.create_list(:user, 10)
      get users_path
      expect(response.status).to eq(200)
    end
  end

  describe "get new_user_path" do  
   it "renders the :new template" do 
     get new_user_path
     expect(response.status).to eq(200)
   end
  end

  describe "get edit_user_path" do
    it "renders the :edit template" do
      user = FactoryBot.create(:user)
      get edit_user_path(id: user.id)
      expect(response).to render_template(:edit)
    end
  end

  describe "delete a user record" do
    it "deletes a user record" do
      user = FactoryBot.create(:user)
      delete user_path(id: user.id)
      expect(response).to redirect_to root_path
    end
  end

end

#I only have new and index views so didn't create a lot of tests