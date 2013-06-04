require 'spec_helper'

describe Post do
  it 'deletes any pictures associated with it' do
    @picture = FactoryGirl.create :picture_with_post
    expect{
      @picture.posts.first.destroy
    }.to change(Picture,:count).by -1
  end
end