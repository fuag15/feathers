require 'spec_helper'

describe 'packages/index' do
  before do
    packages = FactoryGirl.create_list :package, 2
    assign :packages, packages
    render
  end

  it 'displays the image location' do
    expect(view).to render_template('index')
  end
end

describe 'packages/edit' do
  before do
    package = FactoryGirl.create :package
    assign :package, package
    render
  end

  it 'renders _form partial for the package' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'packages/new' do
  before do
    package = FactoryGirl.create :package
    assign :package, package
    render
  end

  it 'displays the image location' do
    expect(view).to render_template( partial: '_form')
  end
end