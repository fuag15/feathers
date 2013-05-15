require 'spec_helper'

describe Image do
  it 'says its owner is a project if its a project' do
    @image = FactoryGirl.create :image_with_article
    expect(@image.owner).to eq @image.article
  end
end