require 'spec_helper'

describe 'pictures/index' do
  before do
    pictures = FactoryGirl.create_list :picture_with_post, 2
    assign :owner, pictures.first.post
    assign :pictures, pictures
    render
  end

  it 'displays the picture location' do
    expect(view).to render_template('index')
  end
end

describe 'pictures/edit' do
  before :each do
    picture = FactoryGirl.create :picture_with_post
    assign :picture, picture
    assign :owner, picture.post
    render
  end

  it 'renders _form partial for the picture' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'pictures/new' do
  before :each do
    picture = FactoryGirl.create :picture_with_post
    assign :picture, picture
    assign :owner, picture.post
    render
  end

  it 'displays the picture location' do
    expect(view).to render_template( partial: '_form')
  end
end