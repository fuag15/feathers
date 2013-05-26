require 'spec_helper'

describe ProjectsController do
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

    it 'loads all of the projects into @projects' do
      projects = FactoryGirl.create_list :project, 2
      get :index
      expect(assigns :projects).to match_array projects
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
      it 'doesnt create an project' do
        expect{
          project :create, project: FactoryGirl.attributes_for(:project)
        }.to change(Project,:count).by 0
      end
    end

    context 'when signed in as admin' do
      it 'creates project' do
        auth_admin
        expect{
          project :create, project: FactoryGirl.attributes_for(:project)
        }.to change(Project,:count).by 1
      end
    end
  end

  describe 'GET edit' do
    context 'when not signed in' do
      it 'doesnt create an project' do
        expect{
          project :create, project: FactoryGirl.attributes_for(:project)
        }.to change(Project,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        @project = FactoryGirl.create :project
        get :edit, id: @project
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the appropriate project' do
        expect(assigns :project).to eq @project
      end
    end
  end

  describe 'POST update' do
    before do
      @project = FactoryGirl.create :project
      @new_attr = FactoryGirl.attributes_for :project
    end

    context 'when not signed in' do
      it 'doesnt update the project' do
        project :update, id: @project, project: @new_attr
        @project.reload
        @project.name.should_not eq @new_attr[:name]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the project' do
        project :update, id: @project, project: @new_attr
        @project.reload
        @project.name.should eq @new_attr[:name]
      end
    end
  end

  describe 'GET show' do
    before do
      @project = FactoryGirl.create :project
      get :show, id: @project
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'loads the correct project' do
      expect(assigns :project).to eq @project
    end
  end

  describe 'DELETE destroy' do
    before do
      @project = FactoryGirl.create :project
    end

    context 'when no user logged in' do
      it 'doesnt delete the project' do
        expect{
          delete :destroy, id: @project
        }.not_to change(Project, :count)
      end
    end

    context 'when an admin user is logged in' do
      before do
        auth_admin
      end

      it 'should delete the project' do
        expect{
          delete :destroy, id: @project
        }.to change(Project, :count).by -1
      end
    end
  end
end
