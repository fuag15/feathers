require 'spec_helper'

describe PostsController do
  describe 'GET index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template 'index'
    end

    it 'loads all of the posts into @posts' do
      posts = FactoryGirl.create_list :post, 2
      get :index
      expect(assigns :posts).to match_array posts
    end
  end

  describe 'GET new' do
    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :new
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template 'new'
      end
    end

    context 'when not signed in' do
      it 'redirects to root' do
        get :new
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'POST create' do
    context 'when not signed in' do
      it 'doesnt create an post' do
        expect{
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post,:count).by 0
      end
    end

    context 'when signed in as admin' do
      it 'creates post' do
        auth_admin
        expect{
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post,:count).by 1
      end
    end
  end

  describe 'GET edit' do
    context 'when not signed in' do
      it 'doesnt create an post' do
        expect{
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        @post = FactoryGirl.create :post
        get :edit, id: @post
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the appropriate post' do
        expect(assigns :post).to eq @post
      end
    end
  end

  describe 'POST update' do
    before do
      @post = FactoryGirl.create :post
      @new_attr = FactoryGirl.attributes_for :post
    end

    context 'when not signed in' do
      it 'doesnt update the post' do
        post :update, id: @post, post: @new_attr
        @post.reload
        @post.title.should_not eq @new_attr[:title]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the post' do
        post :update, id: @post, post: @new_attr
        @post.reload
        @post.title.should eq @new_attr[:title]
      end
    end
  end

  describe 'GET show' do
    before do
      @post = FactoryGirl.create :post
      get :show, id: @post
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'loads the correct post' do
      expect(assigns :post).to eq @post
    end
  end

  describe 'DELETE destroy' do
    before do
      @post = FactoryGirl.create :post
    end

    context 'when no user logged in' do
      it 'doesnt delete the post' do
        expect{
          delete :destroy, id: @post
        }.not_to change(Post, :count)
      end
    end

    context 'when an admin user is logged in' do
      before do
        auth_admin
      end

      it 'should delete the post' do
        expect{
          delete :destroy, id: @post
        }.to change(Post, :count).by -1
      end
    end
  end
end
