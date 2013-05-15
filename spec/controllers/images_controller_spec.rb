require 'spec_helper'

describe ImagesController do
  before do
    @image = FactoryGirl.create :image_with_article
  end

  describe 'GET index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index, article_id: @image.article
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'renders the index template' do
      get :index, article_id: @image.article
      expect(response).to render_template 'index'
    end

    it 'loads all of the images into @images' do
      image1 = FactoryGirl.create :image_with_article
      image2 = FactoryGirl.create :image_with_article
      get :index, article_id: @image.article
      expect(assigns :images).to match_array [@image, image1, image2]
    end
  end

  describe 'GET new' do
    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :new, article_id: @image.article
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'renders the new template' do
        get :new, article_id: @image.article
        expect(response).to render_template 'new'
      end
    end

    context 'when not signed in' do
      it 'redirects to root' do
        get :new, article_id: @image.article
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'POST create' do
    context 'when not signed in' do
      it 'doesnt create an image' do
        expect{
          post :create, article_id: @image.article, image: FactoryGirl.attributes_for(:image)
        }.to change(Image,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'creates article' do 
        expect{
          post :create, article_id: @image.article, image: FactoryGirl.attributes_for(:image)
        }.to change(Image,:count).by 1
      end

      it 'creates an article that has the right owner' do
        post :create, article_id: @image.article, image: FactoryGirl.attributes_for(:image)
        expect(Image.last.article).to eq @image.article
      end
    end
  end

  describe 'GET edit' do
    context 'when not signed in' do
      it 'doesnt create an article' do
        expect{
          post :create, article_id: @image.article, image: FactoryGirl.attributes_for(:image)
        }.to change(Image,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        get :edit, article_id: @image.article, id: @image
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the appropriate image' do
        expect(assigns :image).to eq @image
      end
    end
  end

  describe 'POST update' do
    before do
      @new_attr = FactoryGirl.attributes_for :image
    end

    context 'when not signed in' do
      it 'doesnt update the image' do
        post :update, article_id: @image.article, id: @image, image: @new_attr
        @image.reload
        @image.name.should_not eq @new_attr[:name]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the image' do
        post :update, article_id: @image.article, id: @image, image: @new_attr
        @image.reload
        @image.name.should eq @new_attr[:name]
      end
    end
  end

  describe 'GET show' do
    before do
      get :show, article_id: @image.article, id: @image
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'loads the correct image' do
      expect(assigns :image).to eq @image
    end
  end

  describe 'DELETE destroy' do
    context 'when no user logged in' do
      it 'doesnt delete the image' do
        expect{
          delete :destroy, article_id: @image.article, id: @image
        }.not_to change(Image, :count)
      end
    end

    context 'when an admin user is logged in' do
      before do
        auth_admin
      end

      it 'should delete the image' do
        expect{
          delete :destroy, article_id: @image.article, id: @image
        }.to change(Image, :count).by -1
      end
    end
  end
end
