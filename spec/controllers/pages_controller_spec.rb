require 'spec_helper'

describe PagesController do
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

  describe 'GET contact' do
    it 'responds successfully with an HTTP 200 status code' do
      get :contact
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'renders the contact template' do
      get :contact
      expect(response).to render_template 'contact'
    end
  end

  describe 'GET about' do
    it 'responds successfully with an HTTP 200 status code' do
      get :about
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'renders the about template' do
      get :about
      expect(response).to render_template 'about'
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