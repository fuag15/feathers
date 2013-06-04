require 'spec_helper'

describe Picture do
  it 'says its owner is a post if its a post' do
    @picture = FactoryGirl.create :picture_with_post
    expect(@picture.owner).to eq @picture.posts.first
  end

  it 'says its owner is a project if its a project' do
    @picture = FactoryGirl.create :picture_with_project
    expect(@picture.owner).to eq @picture.projects.first
  end

  it 'says its owner is a package if its a job' do
    @picture = FactoryGirl.create :picture_with_job
    expect(@picture.owner).to eq @picture.jobs.first
  end
end