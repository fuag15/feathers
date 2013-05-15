require 'spec_helper'

describe ArticlesController do
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

    it 'loads all of the articles into @articles' do
      article1 = FactoryGirl.create :article
      article2 = FactoryGirl.create :article
      get :index
      expect(assigns :articles).to match_array [article1, article2]
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
      it 'doesnt create an article' do
        expect{
          post :create, article: FactoryGirl.attributes_for(:article)
        }.to change(Article,:count).by 0
      end
    end

    context 'when signed in as admin' do
      it 'creates article' do 
        auth_admin
        expect{
          post :create, article: FactoryGirl.attributes_for(:article)
        }.to change(Article,:count).by 1
      end
    end
  end

  describe 'GET edit' do
    context 'when not signed in' do
      it 'doesnt create an article' do
        expect{
          post :create, article: FactoryGirl.attributes_for(:article)
        }.to change(Article,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        @article = FactoryGirl.create :article
        get :edit, id: @article
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the appropriate article' do
        expect(assigns :article).to eq @article
      end
    end
  end

  describe 'POST update' do
    before do
      @article = FactoryGirl.create :article
      @new_attr = FactoryGirl.attributes_for :article
    end

    context 'when not signed in' do
      it 'doesnt update the article' do
        post :update, id: @article, article: @new_attr
        @article.reload
        @article.name.should_not eq @new_attr[:name]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the article' do
        post :update, id: @article, article: @new_attr
        @article.reload
        @article.name.should eq @new_attr[:name]
      end
    end
  end

  describe 'GET show' do
    before do
      @article = FactoryGirl.create :article
      get :show, id: @article
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'loads the correct article' do
      expect(assigns :article).to eq @article
    end
  end

  describe 'DELETE destroy' do
    before do
      @article = FactoryGirl.create :article
    end

    context 'when no user logged in' do
      it 'doesnt delete the article' do
        expect{
          delete :destroy, id: @article
        }.not_to change(Article, :count)
      end
    end

    context 'when an admin user is logged in' do
      before do
        auth_admin
      end

      it 'should delete the article' do
        expect{
          delete :destroy, id: @article
        }.to change(Article, :count).by -1
      end
    end
  end
end
