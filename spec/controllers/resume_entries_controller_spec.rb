require 'spec_helper'

describe ResumeEntriesController do
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

    it 'loads all of the resume_entries into @resume_entries' do
      resume_entries = FactoryGirl.create_list :resume_entry, 2
      get :index
      expect(assigns :resume_entries).to match_array resume_entries
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
      it 'doesnt create an resume_entry' do
        expect{
          resume_entry :create, resume_entry: FactoryGirl.attributes_for(:resume_entry)
        }.to change(ResumeEntry,:count).by 0
      end
    end

    context 'when signed in as admin' do
      it 'creates resume_entry' do
        auth_admin
        expect{
          resume_entry :create, resume_entry: FactoryGirl.attributes_for(:resume_entry)
        }.to change(ResumeEntry,:count).by 1
      end
    end
  end

  describe 'GET edit' do
    context 'when not signed in' do
      it 'doesnt create an resume_entry' do
        expect{
          resume_entry :create, resume_entry: FactoryGirl.attributes_for(:resume_entry)
        }.to change(ResumeEntry,:count).by 0
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
        @resume_entry = FactoryGirl.create :resume_entry
        get :edit, id: @resume_entry
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'loads the appropriate resume_entry' do
        expect(assigns :resume_entry).to eq @resume_entry
      end
    end
  end

  describe 'POST update' do
    before do
      @resume_entry = FactoryGirl.create :resume_entry
      @new_attr = FactoryGirl.attributes_for :resume_entry
    end

    context 'when not signed in' do
      it 'doesnt update the resume_entry' do
        resume_entry :update, id: @resume_entry, resume_entry: @new_attr
        @resume_entry.reload
        @resume_entry.name.should_not eq @new_attr[:name]
      end
    end

    context 'when signed in as admin' do
      before do
        auth_admin
      end

      it 'should update the resume_entry' do
        resume_entry :update, id: @resume_entry, resume_entry: @new_attr
        @resume_entry.reload
        @resume_entry.name.should eq @new_attr[:name]
      end
    end
  end

  describe 'GET show' do
    before do
      @resume_entry = FactoryGirl.create :resume_entry
      get :show, id: @resume_entry
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'loads the correct resume_entry' do
      expect(assigns :resume_entry).to eq @resume_entry
    end
  end

  describe 'DELETE destroy' do
    before do
      @resume_entry = FactoryGirl.create :resume_entry
    end

    context 'when no user logged in' do
      it 'doesnt delete the resume_entry' do
        expect{
          delete :destroy, id: @resume_entry
        }.not_to change(ResumeEntry, :count)
      end
    end

    context 'when an admin user is logged in' do
      before do
        auth_admin
      end

      it 'should delete the resume_entry' do
        expect{
          delete :destroy, id: @resume_entry
        }.to change(ResumeEntry, :count).by -1
      end
    end
  end
end
