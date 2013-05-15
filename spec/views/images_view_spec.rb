require 'spec_helper'

describe 'images/edit' do
  before :each do
    image = FactoryGirl.create :image_with_article
    assign :image, image
    assign :owner, image.article
    render
  end

  it 'renders _form partial for the image' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'images/new' do
  before :each do
    image = FactoryGirl.create :image_with_article
    assign :image, image
    assign :owner, image.article
    render
  end
  
  it 'displays the image location' do
    expect(view).to render_template( partial: '_form')
  end
end