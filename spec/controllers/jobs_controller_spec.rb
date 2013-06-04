require 'spec_helper'

describe JobsController do
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

    it 'loads all of the jobs into @jobs' do
      jobs = FactoryGirl.create_list :job, 2
      get :index
      expect(assigns :jobs).to match_array jobs
    end
  end

  describe 'GET new' do
    before do
      @job_category = FactoryGirl.create :job_category
    end
    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :new, job_category_id: @job_category.id
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'renders the new template' do
        get :new, job_category_id: @job_category.id
        expect(response).to render_template 'new'
      end
    end

    context 'when not signed in' do
      it 'redirects to root' do
        get :new, job_category_id: @job_category.id
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'POST create' do
    before do
      @job_category = FactoryGirl.create :job_category
    end

    context 'when not signed in' do
      it 'doesnt create an job' do
        expect{
          post :create, job: FactoryGirl.attributes_for(:job), job_category_id: @job_category.id
        }.to change(Job,:count).by 0
      end
    end

    context 'when signed in as admin' do
      it 'creates job' do
        auth_admin
        expect{
          post :create, job: FactoryGirl.attributes_for(:job), job_category_id: @job_category.id
        }.to change(Job,:count).by 1
      end
    end
  end

  describe 'GET edit' do
    before do
      @job_category = FactoryGirl.create :job_category
    end

    context 'when not signed in' do
      it 'doesnt create an job' do
        expect{
          post :create, job: FactoryGirl.attributes_for(:job), job_category_id: @job_category.id
        }.to change(Job,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        @job = FactoryGirl.create :job
        get :edit, id: @job, job_category_id: @job.job_category
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the appropriate job' do
        expect(assigns :job).to eq @job
      end
    end
  end

  describe 'POST update' do
    before do
      @job = FactoryGirl.create :job
      @new_attr = FactoryGirl.attributes_for :job
    end

    context 'when not signed in' do
      it 'doesnt update the job' do
        post :update, id: @job, job: @new_attr
        @job.reload
        @job.name.should_not eq @new_attr[:name]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the job' do
        post :update, id: @job, job: @new_attr
        @job.reload
        @job.name.should eq @new_attr[:name]
      end
    end
  end

  describe 'GET show' do
    before do
      @job = FactoryGirl.create :job
      get :show, id: @job
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'loads the correct job' do
      expect(assigns :job).to eq @job
    end
  end

  describe 'DELETE destroy' do
    before do
      @job = FactoryGirl.create :job
    end

    context 'when no user logged in' do
      it 'doesnt delete the job' do
        expect{
          delete :destroy, id: @job
        }.not_to change(Job, :count)
      end
    end

    context 'when an admin user is logged in' do
      before do
        auth_admin
      end

      it 'should delete the job' do
        expect{
          delete :destroy, id: @job
        }.to change(Job, :count).by -1
      end
    end
  end
end
