require 'spec_helper'

describe AddressesController do
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

    it 'loads all of the addresses into @addresses' do
      addresses = FactoryGirl.create_list :address, 2
      get :index
      expect(assigns :addresses).to match_array addresses
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
      it 'doesnt create an address' do
        expect{
          address :create, address: FactoryGirl.attributes_for(:address)
        }.to change(Address,:count).by 0
      end
    end

    context 'when signed in as admin' do
      it 'creates address' do
        auth_admin
        expect{
          address :create, address: FactoryGirl.attributes_for(:address)
        }.to change(Address,:count).by 1
      end
    end
  end

  describe 'GET edit' do
    context 'when not signed in' do
      it 'doesnt create an address' do
        expect{
          address :create, address: FactoryGirl.attributes_for(:address)
        }.to change(Address,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        @address = FactoryGirl.create :address
        get :edit, id: @address
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the appropriate address' do
        expect(assigns :address).to eq @address
      end
    end
  end

  describe 'POST update' do
    before do
      @address = FactoryGirl.create :address
      @new_attr = FactoryGirl.attributes_for :address
    end

    context 'when not signed in' do
      it 'doesnt update the address' do
        address :update, id: @address, address: @new_attr
        @address.reload
        @address.name.should_not eq @new_attr[:name]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the address' do
        address :update, id: @address, address: @new_attr
        @address.reload
        @address.name.should eq @new_attr[:name]
      end
    end
  end

  describe 'GET show' do
    before do
      @address = FactoryGirl.create :address
      get :show, id: @address
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'loads the correct address' do
      expect(assigns :address).to eq @address
    end
  end

  describe 'DELETE destroy' do
    before do
      @address = FactoryGirl.create :address
    end

    context 'when no user logged in' do
      it 'doesnt delete the address' do
        expect{
          delete :destroy, id: @address
        }.not_to change(Address, :count)
      end
    end

    context 'when an admin user is logged in' do
      before do
        auth_admin
      end

      it 'should delete the address' do
        expect{
          delete :destroy, id: @address
        }.to change(Address, :count).by -1
      end
    end
  end
end
