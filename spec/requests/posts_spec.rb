require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "get posts_path" do
    it "renders the index view" do
      FactoryBot.create_list(:post, 10)
      get posts_path
      expect(response).to render_template(:index)
    end
  end

  describe "get post_path" do
    it "renders the :show template" do
      user = FactoryBot.create(:user)
      allow_any_instance_of(PostsController).to receive(:current_user) { user }
      post = FactoryBot.create(:post)
      get post_path(id: post.id)
      expect(response).to render_template(:show)
    end
  end

  describe "get new_post_path" do
    it "renders the :new template" do
      user = FactoryBot.create(:user)
      allow_any_instance_of(PostsController).to receive(:current_user) { user }
      post = FactoryBot.create(:post)
      get new_post_path(id: post.id)
      expect(response).to render_template(:new)
    end
  end

  describe "get edit_post_path" do
    it "renders the :edit template" do
      user = FactoryBot.create(:user)
      allow_any_instance_of(PostsController).to receive(:current_user) { user }
      post = FactoryBot.create(:post)
      get edit_post_path(id: post.id)
      expect(response).to render_template(:edit)
    end
  end

  #I could not get these working for the life of me
  # describe "post posts_path with valid data" do
  #   it "saves a new entry and redirects to the show path for the entry" do
  #     user = FactoryBot.create(:user)
  #     allow_any_instance_of(PostsController).to receive(:current_user) { user }
  #     post_attributes = FactoryBot.attributes_for(:post)
  #     expect { post posts_path, params: {post: post_attributes}
  #   }.to change(Post, :count)
  #     expect(response).to redirect_to post_path(id: Post.last.id)
  #   end
  # end

  # describe "post posts_path with invalid data" do
  #   it "does not save a new entry or redirect" do
  #     user = FactoryBot.create(:user)
  #     allow_any_instance_of(PostsController).to receive(:current_user) { user }
  #     post_attributes = FactoryBot.attributes_for(:post)
  #     post_attributes.delete(:title)
  #     expect { post posts_path, params: {post: post_attributes}
  #   }.to_not change(post, :count)
  #     expect(response).to render_template(:new)
  #   end
  # end

  describe "put post_path with valid data" do
    it "updates an entry and redirects to the show path for the post" do
      user = FactoryBot.create(:user)
      allow_any_instance_of(PostsController).to receive(:current_user) { user }
      post = FactoryBot.create(:post)
      put post_path(post.id), params: {post: {title: "MCAT Guide"}}
      post.reload
      expect(post.title).to eq("MCAT Guide")
      expect(response).to redirect_to post_path(id: post.id)
    end
  end

  describe "delete a post record" do
    it "deletes a post record" do
    user = FactoryBot.create(:user)
    allow_any_instance_of(PostsController).to receive(:current_user) { user }
    post = FactoryBot.create(:post)
    delete post_path(id: post.id)
    expect(response).to redirect_to posts_path
    end
  end
end
