require 'spec_helper'

describe 'resumes/index' do
  before do
    addresses = FactoryGirl.create_list :address, 2
    resume_categories = FactoryGirl.create_list :resume_category, 2
    assign :addresses, addresses
    assign :resume_categories, resume_categories
    render
  end

  it 'renders the index view' do
    expect(view).to render_template('index')
  end
end