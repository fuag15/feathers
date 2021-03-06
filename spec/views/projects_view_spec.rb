require 'spec_helper'

describe 'projects/index' do
  before do
    project_categories = FactoryGirl.create_list :project_category, 2
    assign :project_categories, Kaminari.paginate_array(project_categories).page(1)
    render
  end

  it 'displays the index template' do
    expect(view).to render_template('index')
  end
end

describe 'projects/edit' do
  before do
    project = FactoryGirl.create :project
    assign :project, project
    render
  end

  it 'renders _form partial for the project' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'projects/new' do
  before do
    project = FactoryGirl.create :project
    assign :project, project
    render
  end

  it 'displays the image location' do
    expect(view).to render_template( partial: '_form')
  end
end