require 'spec_helper'

describe PackagesController do
  describe 'given I have a Package with a Project' do
    before do
      @package = FactoryGirl.create :package_with_project
    end

    describe 'GET index' do
      it 'responds successfully with an HTTP 200 status code' do
        get :index, project_id: @package.projects.first
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'renders the index template' do
        get :index, project_id: @package.projects.first
        expect(response).to render_template 'index'
      end

      it 'loads all of the packages into @packages' do
        project = FactoryGirl.create :project_with_pictures_and_packages
        get :index, project_id: project
        expect(assigns :packages).to match_array project.packages
      end
    end

    describe 'GET new' do
      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'responds successfully with an HTTP 200 status code' do
          get :new, project_id: @package.projects.first
          expect(response).to be_success
          expect(response.code).to eq '200'
        end

        it 'renders the new template' do
          get :new, project_id: @package.projects.first
          expect(response).to render_template 'new'
        end
      end

      context 'when not signed in' do
        it 'redirects to root' do
          get :new, project_id: @package.projects.first
          expect(response).to redirect_to root_path
        end
      end
    end

    describe 'POST create' do
      context 'when not signed in' do
        it 'doesnt create an package' do
          expect{
            post :create, package: FactoryGirl.attributes_for(:package), project_id: @package.projects.first
          }.to change(Package,:count).by 0
        end
      end

      context 'when signed in as admin' do
        it 'creates package' do
          auth_admin
          expect{
            post :create, package: FactoryGirl.attributes_for(:package), project_id: @package.projects.first
          }.to change(Package,:count).by 1
        end
      end
    end

    describe 'GET edit' do
      context 'when not signed in' do
        it 'doesnt create an package' do
          expect{
            post :create, package: FactoryGirl.attributes_for(:package), project_id: @package.projects.first
          }.to change(Package,:count).by 0
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
          get :edit, id: @package, project_id: @package.projects.first
        end

        it 'responds successfully with an HTTP 200 status code' do
          expect(response).to be_success
          expect(response.code).to eq '200'
        end

        it 'loads the appropriate package' do
          expect(assigns :package).to eq @package
        end
      end
    end

    describe 'POST update' do
      before do
        @new_attr = FactoryGirl.attributes_for :package
      end

      context 'when not signed in' do
        it 'doesnt update the package' do
          post :update, id: @package, package: @new_attr
          @package.reload
          @package.version.should_not eq @new_attr[:version]
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'should update the package' do
          post :update, id: @package, package: @new_attr
          @package.reload
          @package.version.should eq @new_attr[:version]
        end
      end
    end

    describe 'GET show' do
      before do
        get :show, id: @package
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the correct package' do
        expect(assigns :package).to eq @package
      end
    end

    describe 'DELETE destroy' do
      context 'when no user logged in' do
        it 'doesnt delete the package' do
          expect{
            delete :destroy, id: @package
          }.not_to change(Package, :count)
        end
      end

      context 'when an admin user is logged in' do
        before do
          auth_admin
        end

        it 'should delete the package' do
          expect{
            delete :destroy, id: @package, project_id: @package.projects.first
          }.to change(Package, :count).by -1
        end
      end
    end
  end

  describe 'given I have a Package with a Job' do
    before do
      @package = FactoryGirl.create :package_with_job
    end

    describe 'GET index' do
      it 'responds successfully with an HTTP 200 status code' do
        get :index, job_id: @package.jobs.first
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'renders the index template' do
        get :index, job_id: @package.jobs.first
        expect(response).to render_template 'index'
      end

      it 'loads all of the packages into @packages' do
        job = FactoryGirl.create :job_with_pictures_and_packages
        get :index, job_id: job
        expect(assigns :packages).to match_array job.packages
      end
    end

    describe 'GET new' do
      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'responds successfully with an HTTP 200 status code' do
          get :new, job_id: @package.jobs.first
          expect(response).to be_success
          expect(response.code).to eq '200'
        end

        it 'renders the new template' do
          get :new, job_id: @package.jobs.first
          expect(response).to render_template 'new'
        end
      end

      context 'when not signed in' do
        it 'redirects to root' do
          get :new, job_id: @package.jobs.first
          expect(response).to redirect_to root_path
        end
      end
    end

    describe 'POST create' do
      context 'when not signed in' do
        it 'doesnt create an package' do
          expect{
            post :create, package: FactoryGirl.attributes_for(:package), job_id: @package.jobs.first
          }.to change(Package,:count).by 0
        end
      end

      context 'when signed in as admin' do
        it 'creates package' do
          auth_admin
          expect{
            post :create, package: FactoryGirl.attributes_for(:package), job_id: @package.jobs.first
          }.to change(Package,:count).by 1
        end
      end
    end

    describe 'GET edit' do
      context 'when not signed in' do
        it 'doesnt create an package' do
          expect{
            post :create, package: FactoryGirl.attributes_for(:package), job_id: @package.jobs.first
          }.to change(Package,:count).by 0
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
          get :edit, id: @package, job_id: @package.jobs.first
        end

        it 'responds successfully with an HTTP 200 status code' do
          expect(response).to be_success
          expect(response.code).to eq '200'
        end

        it 'loads the appropriate package' do
          expect(assigns :package).to eq @package
        end
      end
    end

    describe 'POST update' do
      before do
        @new_attr = FactoryGirl.attributes_for :package
      end

      context 'when not signed in' do
        it 'doesnt update the package' do
          post :update, id: @package, package: @new_attr
          @package.reload
          @package.version.should_not eq @new_attr[:version]
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'should update the package' do
          post :update, id: @package, package: @new_attr
          @package.reload
          @package.version.should eq @new_attr[:version]
        end
      end
    end

    describe 'GET show' do
      before do
        get :show, id: @package
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the correct package' do
        expect(assigns :package).to eq @package
      end
    end

    describe 'DELETE destroy' do
      context 'when no user logged in' do
        it 'doesnt delete the package' do
          expect{
            delete :destroy, id: @package
          }.not_to change(Package, :count)
        end
      end

      context 'when an admin user is logged in' do
        before do
          auth_admin
        end

        it 'should delete the package' do
          expect{
            delete :destroy, id: @package, job_id: @package.jobs.first
          }.to change(Package, :count).by -1
        end
      end
    end
  end
end
