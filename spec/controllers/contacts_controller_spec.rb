require 'spec_helper'

describe ContactController do
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
  end

  describe 'POST submit' do
    before do
      post :submit, from: Forgery(:internet).email_address, text: Forgery(:lorem_ipsum).words
    end

    it 'should redirect to contact' do
      expect(response).to redirect_to contact_path
    end
  end
end