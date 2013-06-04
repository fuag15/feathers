require 'spec_helper'

describe ResumeCategoriesController do
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

    it 'loads all of the resume_categories into @resume_categories' do
      resume_categories = FactoryGirl.create_list :resume_category, 2
      get :index
      expect(assigns :resume_categories).to match_array resume_categories
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
      it 'doesnt create an resume_category' do
        expect{
          post :create, resume_category: FactoryGirl.attributes_for(:resume_category)
        }.to change(ResumeCategory,:count).by 0
      end
    end

    context 'when signed in as admin' do
      it 'creates resume_category' do
        auth_admin
        expect{
          post :create, resume_category: FactoryGirl.attributes_for(:resume_category)
        }.to change(ResumeCategory,:count).by 1
      end
    end
  end

  describe 'GET edit' do
    context 'when not signed in' do
      it 'doesnt create an resume_category' do
        expect{
          post :create, resume_category: FactoryGirl.attributes_for(:resume_category)
        }.to change(ResumeCategory,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        @resume_category = FactoryGirl.create :resume_category
        get :edit, id: @resume_category
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the appropriate resume_category' do
        expect(assigns :resume_category).to eq @resume_category
      end
    end
  end

  describe 'POST update' do
    before do
      @resume_category = FactoryGirl.create :resume_category
      @new_attr = FactoryGirl.attributes_for :resume_category
    end

    context 'when not signed in' do
      it 'doesnt update the resume_category' do
        post :update, id: @resume_category, resume_category: @new_attr
        @resume_category.reload
        @resume_category.name.should_not eq @new_attr[:name]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the resume_category' do
        post :update, id: @resume_category, resume_category: @new_attr
        @resume_category.reload
        @resume_category.name.should eq @new_attr[:name]
      end
    end
  end

  describe 'GET show' do
    before do
      @resume_category = FactoryGirl.create :resume_category
      get :show, id: @resume_category
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'loads the correct resume_category' do
      expect(assigns :resume_category).to eq @resume_category
    end
  end

  describe 'DELETE destroy' do
    before do
      @resume_category = FactoryGirl.create :resume_category
    end

    context 'when no user logged in' do
      it 'doesnt delete the resume_category' do
        expect{
          delete :destroy, id: @resume_category
        }.not_to change(ResumeCategory, :count)
      end
    end

    context 'when an admin user is logged in' do
      before do
        auth_admin
      end

      it 'should delete the resume_category' do
        expect{
          delete :destroy, id: @resume_category
        }.to change(ResumeCategory, :count).by -1
      end
    end
  end
end
