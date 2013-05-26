require 'spec_helper'

describe ProjectCategoriesController do
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

    it 'loads all of the project_categories into @project_categories' do
      project_categories = FactoryGirl.create_list :project_category, 2
      get :index
      expect(assigns :project_categories).to match_array project_categories
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
      it 'doesnt create an project_category' do
        expect{
          project_category :create, project_category: FactoryGirl.attributes_for(:project_category)
        }.to change(ProjectCategory,:count).by 0
      end
    end

    context 'when signed in as admin' do
      it 'creates project_category' do
        auth_admin
        expect{
          project_category :create, project_category: FactoryGirl.attributes_for(:project_category)
        }.to change(ProjectCategory,:count).by 1
      end
    end
  end

  describe 'GET edit' do
    context 'when not signed in' do
      it 'doesnt create an project_category' do
        expect{
          project_category :create, project_category: FactoryGirl.attributes_for(:project_category)
        }.to change(ProjectCategory,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        @project_category = FactoryGirl.create :project_category
        get :edit, id: @project_category
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the appropriate project_category' do
        expect(assigns :project_category).to eq @project_category
      end
    end
  end

  describe 'POST update' do
    before do
      @project_category = FactoryGirl.create :project_category
      @new_attr = FactoryGirl.attributes_for :project_category
    end

    context 'when not signed in' do
      it 'doesnt update the project_category' do
        project_category :update, id: @project_category, project_category: @new_attr
        @project_category.reload
        @project_category.name.should_not eq @new_attr[:name]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the project_category' do
        project_category :update, id: @project_category, project_category: @new_attr
        @project_category.reload
        @project_category.name.should eq @new_attr[:name]
      end
    end
  end

  describe 'GET show' do
    before do
      @project_category = FactoryGirl.create :project_category
      get :show, id: @project_category
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'loads the correct project_category' do
      expect(assigns :project_category).to eq @project_category
    end
  end

  describe 'DELETE destroy' do
    before do
      @project_category = FactoryGirl.create :project_category
    end

    context 'when no user logged in' do
      it 'doesnt delete the project_category' do
        expect{
          delete :destroy, id: @project_category
        }.not_to change(ProjectCategory, :count)
      end
    end

    context 'when an admin user is logged in' do
      before do
        auth_admin
      end

      it 'should delete the project_category' do
        expect{
          delete :destroy, id: @project_category
        }.to change(ProjectCategory, :count).by -1
      end
    end
  end
end
