require 'spec_helper'

describe 'resume_categories/index' do
  before do
    resume_categories = FactoryGirl.create_list :resume_category, 2
    assign :resume_categories, resume_categories
    render
  end

  it 'displays the image location' do
    expect(view).to render_template('index')
  end
end

describe 'resume_categories/edit' do
  before do
    resume_category = FactoryGirl.create :resume_category
    assign :resume_category, resume_category
    render
  end

  it 'renders _form partial for the resume_category' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'resume_categories/new' do
  before do
    resume_category = FactoryGirl.create :resume_category
    assign :resume_category, resume_category
    render
  end

  it 'displays the image location' do
    expect(view).to render_template( partial: '_form')
  end
end