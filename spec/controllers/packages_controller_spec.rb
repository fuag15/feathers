require 'spec_helper'

describe PackagesController do
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

    it 'loads all of the packages into @packages' do
      packages = FactoryGirl.create_list :package, 2
      get :index
      expect(assigns :packages).to match_array packages
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
      it 'doesnt create an package' do
        expect{
          package :create, package: FactoryGirl.attributes_for(:package)
        }.to change(Package,:count).by 0
      end
    end

    context 'when signed in as admin' do
      it 'creates package' do
        auth_admin
        expect{
          package :create, package: FactoryGirl.attributes_for(:package)
        }.to change(Package,:count).by 1
      end
    end
  end

  describe 'GET edit' do
    context 'when not signed in' do
      it 'doesnt create an package' do
        expect{
          package :create, package: FactoryGirl.attributes_for(:package)
        }.to change(Package,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        @package = FactoryGirl.create :package
        get :edit, id: @package
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
      @package = FactoryGirl.create :package
      @new_attr = FactoryGirl.attributes_for :package
    end

    context 'when not signed in' do
      it 'doesnt update the package' do
        package :update, id: @package, package: @new_attr
        @package.reload
        @package.name.should_not eq @new_attr[:name]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the package' do
        package :update, id: @package, package: @new_attr
        @package.reload
        @package.name.should eq @new_attr[:name]
      end
    end
  end

  describe 'GET show' do
    before do
      @package = FactoryGirl.create :package
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
    before do
      @package = FactoryGirl.create :package
    end

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
          delete :destroy, id: @package
        }.to change(Package, :count).by -1
      end
    end
  end
end
