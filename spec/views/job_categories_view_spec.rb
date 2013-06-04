require 'spec_helper'

describe 'job_categories/index' do
  before do
    job_categories = FactoryGirl.create_list :job_category, 2
    assign :job_categories, job_categories
    render
  end

  it 'displays the image location' do
    expect(view).to render_template('index')
  end
end

describe 'job_categories/edit' do
  before do
    job_category = FactoryGirl.create :job_category
    assign :job_category, job_category
    render
  end

  it 'renders _form partial for the job_category' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'job_categories/new' do
  before do
    job_category = FactoryGirl.create :job_category
    assign :job_category, job_category
    render
  end

  it 'displays the image location' do
    expect(view).to render_template( partial: '_form')
  end
end