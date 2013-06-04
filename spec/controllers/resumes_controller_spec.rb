require 'spec_helper'

describe ResumesController do
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
      addresses = FactoryGirl.create_list :address, 2
      get :index
      expect(assigns :addresses).to match_array addresses
      expect(assigns :resume_categories).to match_array resume_categories
    end
  end
end
