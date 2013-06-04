require 'spec_helper'

describe 'project_categories/index' do
  before do
    project_categories = FactoryGirl.create_list :project_category, 2
    assign :project_categories, project_categories
    render
  end

  it 'displays the image location' do
    expect(view).to render_template('index')
  end
end

describe 'project_categories/edit' do
  before do
    project_category = FactoryGirl.create :project_category
    assign :project_category, project_category
    render
  end

  it 'renders _form partial for the project_category' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'project_categories/new' do
  before do
    project_category = FactoryGirl.create :project_category
    assign :project_category, project_category
    render
  end

  it 'displays the image location' do
    expect(view).to render_template( partial: '_form')
  end
end