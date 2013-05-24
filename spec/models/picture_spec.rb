require 'spec_helper'

describe Picture do
  it 'says its owner is a post if its a post' do
    @picture = FactoryGirl.create :picture_with_post
    expect(@picture.owner).to eq @picture.post
  end

  it 'says its owner is a project if its a project' do
    @picture = FactoryGirl.create :picture_with_project
    expect(@picture.owner).to eq @picture.project
  end

  it 'says its owner is a package if its a package' do
    @picture = FactoryGirl.create :picture_with_package
    expect(@picture.owner).to eq @picture.package
  end
end