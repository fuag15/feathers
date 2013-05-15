require 'spec_helper'

describe 'articles/edit' do
  before do
    article = FactoryGirl.create :article
    assign :article, article
    render
  end

  it 'renders _form partial for the article' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'articles/new' do
  before do
    article = FactoryGirl.create :article
    assign :article, article
    render
  end

  it 'displays the image location' do
    expect(view).to render_template( partial: '_form')
  end
end