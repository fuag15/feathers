require 'spec_helper'

describe JobCategoriesController do
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

    it 'loads all of the job_categories into @job_categories' do
      job_categories = FactoryGirl.create_list :job_category, 2
      get :index
      expect(assigns :job_categories).to match_array job_categories
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
      it 'doesnt create an job_category' do
        expect{
          post :create, job_category: FactoryGirl.attributes_for(:job_category)
        }.to change(JobCategory,:count).by 0
      end
    end

    context 'when signed in as admin' do
      it 'creates job_category' do
        auth_admin
        expect{
          post :create, job_category: FactoryGirl.attributes_for(:job_category)
        }.to change(JobCategory,:count).by 1
      end
    end
  end

  describe 'GET edit' do
    context 'when not signed in' do
      it 'doesnt create an job_category' do
        expect{
          post :create, job_category: FactoryGirl.attributes_for(:job_category)
        }.to change(JobCategory,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        @job_category = FactoryGirl.create :job_category
        get :edit, id: @job_category
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the appropriate job_category' do
        expect(assigns :job_category).to eq @job_category
      end
    end
  end

  describe 'POST update' do
    before do
      @job_category = FactoryGirl.create :job_category
      @new_attr = FactoryGirl.attributes_for :job_category
    end

    context 'when not signed in' do
      it 'doesnt update the job_category' do
        post :update, id: @job_category, job_category: @new_attr
        @job_category.reload
        @job_category.name.should_not eq @new_attr[:name]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the job_category' do
        post :update, id: @job_category, job_category: @new_attr
        @job_category.reload
        @job_category.name.should eq @new_attr[:name]
      end
    end
  end

  describe 'GET show' do
    before do
      @job_category = FactoryGirl.create :job_category
      get :show, id: @job_category
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'loads the correct job_category' do
      expect(assigns :job_category).to eq @job_category
    end
  end

  describe 'DELETE destroy' do
    before do
      @job_category = FactoryGirl.create :job_category
    end

    context 'when no user logged in' do
      it 'doesnt delete the job_category' do
        expect{
          delete :destroy, id: @job_category
        }.not_to change(JobCategory, :count)
      end
    end

    context 'when an admin user is logged in' do
      before do
        auth_admin
      end

      it 'should delete the job_category' do
        expect{
          delete :destroy, id: @job_category
        }.to change(JobCategory, :count).by -1
      end
    end
  end
end
