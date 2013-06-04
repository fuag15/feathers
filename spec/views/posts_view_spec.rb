require 'spec_helper'

describe 'posts/index' do
  before do
    posts = FactoryGirl.create_list :post, 2
    assign :posts, Kaminari.paginate_array(posts).page(1)
    render
  end

  it 'displays the image location' do
    expect(view).to render_template('index')
  end
end

describe 'posts/edit' do
  before do
    post = FactoryGirl.create :post
    assign :post, post
    render
  end

  it 'renders _form partial for the post' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'posts/new' do
  before do
    post = FactoryGirl.create :post
    assign :post, post
    render
  end

  it 'renders _form partial for the post' do
    expect(view).to render_template( partial: '_form')
  end
end