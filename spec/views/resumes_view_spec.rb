require 'spec_helper'

describe 'resumes/index' do
  before do
    address = FactoryGirl.create :address
    resume_categories = FactoryGirl.create_list :resume_category, 2
    assign :addresses, address
    assign :resume_categories, resume_categories
    render
  end

  it 'displays the image location' do
    expect(view).to render_template('index')
  end
end