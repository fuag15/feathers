require 'spec_helper'

describe PicturesController do
  describe 'given I have a Picture with a Post' do
    before do
      @picture = FactoryGirl.create :picture_with_post
    end

    describe 'GET index' do
      it 'responds successfully with an HTTP 200 status code' do
        get :index, post_id: @picture.post
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'renders the index template' do
        get :index, post_id: @picture.post
        expect(response).to render_template 'index'
      end

      it 'loads all of the pictures into @pictures' do
        picture1 = FactoryGirl.create :picture_with_post
        picture2 = FactoryGirl.create :picture_with_post
        get :index, post_id: @picture.post
        expect(assigns :pictures).to match_array [@picture, picture1, picture2]
      end
    end

    describe 'GET new' do
      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'responds successfully with an HTTP 200 status code' do
          get :new, post_id: @picture.post
          expect(response).to be_success
          expect(response.code).to eq '200'
        end

        it 'renders the new template' do
          get :new, post_id: @picture.post
          expect(response).to render_template 'new'
        end
      end

      context 'when not signed in' do
        it 'redirects to root' do
          get :new, post_id: @picture.post
          expect(response).to redirect_to root_path
        end
      end
    end

    describe 'POST create' do
      context 'when not signed in' do
        it 'doesnt create an picture' do
          expect{
            post :create, post_id: @picture.post, picture: FactoryGirl.attributes_for(:picture)
          }.to change(Picture,:count).by 0
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'creates post' do
          expect{
            post :create, post_id: @picture.post, picture: FactoryGirl.attributes_for(:picture)
          }.to change(Picture,:count).by 1
        end

        it 'creates an post that has the right owner' do
          post :create, post_id: @picture.post, picture: FactoryGirl.attributes_for(:picture)
          expect(Picture.last.post).to eq @picture.post
        end
      end
    end

    describe 'GET edit' do
      context 'when not signed in' do
        it 'doesnt create an post' do
          expect{
            post :create, post_id: @picture.post, picture: FactoryGirl.attributes_for(:picture)
          }.to change(Picture,:count).by 0
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
          get :edit, post_id: @picture.post, id: @picture
        end

        it 'responds successfully with an HTTP 200 status code' do
          expect(response).to be_success
          expect(response.code).to eq '200'
        end

        it 'loads the appropriate picture' do
          expect(assigns :picture).to eq @picture
        end
      end
    end

    describe 'POST update' do
      before do
        @new_attr = FactoryGirl.attributes_for :picture
      end

      context 'when not signed in' do
        it 'doesnt update the picture' do
          post :update, post_id: @picture.post, id: @picture, picture: @new_attr
          @picture.reload
          @picture.name.should_not eq @new_attr[:name]
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'should update the picture' do
          post :update, post_id: @picture.post, id: @picture, picture: @new_attr
          @picture.reload
          @picture.name.should eq @new_attr[:name]
        end
      end
    end

    describe 'GET show' do
      before do
        get :show, post_id: @picture.post, id: @picture
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the correct picture' do
        expect(assigns :picture).to eq @picture
      end
    end

    describe 'DELETE destroy' do
      context 'when no user logged in' do
        it 'doesnt delete the picture' do
          expect{
            delete :destroy, post_id: @picture.post, id: @picture
          }.not_to change(Picture, :count)
        end
      end

      context 'when an admin user is logged in' do
        before do
          auth_admin
        end

        it 'should delete the picture' do
          expect{
            delete :destroy, post_id: @picture.post, id: @picture
          }.to change(Picture, :count).by -1
        end
      end
    end
  end

  describe 'given I have a Picture with a Job' do
    before do
      @picture = FactoryGirl.create :picture_with_job
    end

    describe 'GET index' do
      it 'responds successfully with an HTTP 200 status code' do
        get :index, job_id: @picture.job
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'renders the index template' do
        get :index, job_id: @picture.job
        expect(response).to render_template 'index'
      end

      it 'loads all of the pictures into @pictures' do
        picture1 = FactoryGirl.create :picture_with_job
        picture2 = FactoryGirl.create :picture_with_job
        get :index, job_id: @picture.job
        expect(assigns :pictures).to match_array [@picture, picture1, picture2]
      end
    end

    describe 'GET new' do
      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'responds successfully with an HTTP 200 status code' do
          get :new, job_id: @picture.job
          expect(response).to be_success
          expect(response.code).to eq '200'
        end

        it 'renders the new template' do
          get :new, job_id: @picture.job
          expect(response).to render_template 'new'
        end
      end

      context 'when not signed in' do
        it 'redirects to root' do
          get :new, job_id: @picture.job
          expect(response).to redirect_to root_path
        end
      end
    end

    describe 'POST create' do
      context 'when not signed in' do
        it 'doesnt create an picture' do
          expect{
            job :create, job_id: @picture.job, picture: FactoryGirl.attributes_for(:picture)
          }.to change(Picture,:count).by 0
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'creates job' do
          expect{
            job :create, job_id: @picture.job, picture: FactoryGirl.attributes_for(:picture)
          }.to change(Picture,:count).by 1
        end

        it 'creates an job that has the right owner' do
          job :create, job_id: @picture.job, picture: FactoryGirl.attributes_for(:picture)
          expect(Picture.last.job).to eq @picture.job
        end
      end
    end

    describe 'GET edit' do
      context 'when not signed in' do
        it 'doesnt create an job' do
          expect{
            job :create, job_id: @picture.job, picture: FactoryGirl.attributes_for(:picture)
          }.to change(Picture,:count).by 0
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
          get :edit, job_id: @picture.job, id: @picture
        end

        it 'responds successfully with an HTTP 200 status code' do
          expect(response).to be_success
          expect(response.code).to eq '200'
        end

        it 'loads the appropriate picture' do
          expect(assigns :picture).to eq @picture
        end
      end
    end

    describe 'POST update' do
      before do
        @new_attr = FactoryGirl.attributes_for :picture
      end

      context 'when not signed in' do
        it 'doesnt update the picture' do
          job :update, job_id: @picture.job, id: @picture, picture: @new_attr
          @picture.reload
          @picture.name.should_not eq @new_attr[:name]
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'should update the picture' do
          job :update, job_id: @picture.job, id: @picture, picture: @new_attr
          @picture.reload
          @picture.name.should eq @new_attr[:name]
        end
      end
    end

    describe 'GET show' do
      before do
        get :show, job_id: @picture.job, id: @picture
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the correct picture' do
        expect(assigns :picture).to eq @picture
      end
    end

    describe 'DELETE destroy' do
      context 'when no user logged in' do
        it 'doesnt delete the picture' do
          expect{
            delete :destroy, job_id: @picture.job, id: @picture
          }.not_to change(Picture, :count)
        end
      end

      context 'when an admin user is logged in' do
        before do
          auth_admin
        end

        it 'should delete the picture' do
          expect{
            delete :destroy, job_id: @picture.job, id: @picture
          }.to change(Picture, :count).by -1
        end
      end
    end
  end

  describe 'given I have a Picture with a Project' do
    before do
      @picture = FactoryGirl.create :picture_with_project
    end

    describe 'GET index' do
      it 'responds successfully with an HTTP 200 status code' do
        get :index, project_id: @picture.project
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'renders the index template' do
        get :index, project_id: @picture.project
        expect(response).to render_template 'index'
      end

      it 'loads all of the pictures into @pictures' do
        picture1 = FactoryGirl.create :picture_with_project
        picture2 = FactoryGirl.create :picture_with_project
        get :index, project_id: @picture.project
        expect(assigns :pictures).to match_array [@picture, picture1, picture2]
      end
    end

    describe 'GET new' do
      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'responds successfully with an HTTP 200 status code' do
          get :new, project_id: @picture.project
          expect(response).to be_success
          expect(response.code).to eq '200'
        end

        it 'renders the new template' do
          get :new, project_id: @picture.project
          expect(response).to render_template 'new'
        end
      end

      context 'when not signed in' do
        it 'redirects to root' do
          get :new, project_id: @picture.project
          expect(response).to redirect_to root_path
        end
      end
    end

    describe 'POST create' do
      context 'when not signed in' do
        it 'doesnt create an picture' do
          expect{
            project :create, project_id: @picture.project, picture: FactoryGirl.attributes_for(:picture)
          }.to change(Picture,:count).by 0
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'creates project' do
          expect{
            project :create, project_id: @picture.project, picture: FactoryGirl.attributes_for(:picture)
          }.to change(Picture,:count).by 1
        end

        it 'creates an project that has the right owner' do
          project :create, project_id: @picture.project, picture: FactoryGirl.attributes_for(:picture)
          expect(Picture.last.project).to eq @picture.project
        end
      end
    end

    describe 'GET edit' do
      context 'when not signed in' do
        it 'doesnt create an project' do
          expect{
            project :create, project_id: @picture.project, picture: FactoryGirl.attributes_for(:picture)
          }.to change(Picture,:count).by 0
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
          get :edit, project_id: @picture.project, id: @picture
        end

        it 'responds successfully with an HTTP 200 status code' do
          expect(response).to be_success
          expect(response.code).to eq '200'
        end

        it 'loads the appropriate picture' do
          expect(assigns :picture).to eq @picture
        end
      end
    end

    describe 'POST update' do
      before do
        @new_attr = FactoryGirl.attributes_for :picture
      end

      context 'when not signed in' do
        it 'doesnt update the picture' do
          project :update, project_id: @picture.project, id: @picture, picture: @new_attr
          @picture.reload
          @picture.name.should_not eq @new_attr[:name]
        end
      end

      context 'when signed in as admin' do
        before do
          auth_admin
        end

        it 'should update the picture' do
          project :update, project_id: @picture.project, id: @picture, picture: @new_attr
          @picture.reload
          @picture.name.should eq @new_attr[:name]
        end
      end
    end

    describe 'GET show' do
      before do
        get :show, project_id: @picture.project, id: @picture
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the correct picture' do
        expect(assigns :picture).to eq @picture
      end
    end

    describe 'DELETE destroy' do
      context 'when no user logged in' do
        it 'doesnt delete the picture' do
          expect{
            delete :destroy, project_id: @picture.project, id: @picture
          }.not_to change(Picture, :count)
        end
      end

      context 'when an admin user is logged in' do
        before do
          auth_admin
        end

        it 'should delete the picture' do
          expect{
            delete :destroy, project_id: @picture.project, id: @picture
          }.to change(Picture, :count).by -1
        end
      end
    end
  end
end
