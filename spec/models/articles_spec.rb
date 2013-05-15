require 'spec_helper'

describe Article do
  it 'deletes any images associated with it' do
    @image = FactoryGirl.create :image_with_article
    expect{
      @image.article.destroy
    }.to change(Image,:count).by -1
  end
end