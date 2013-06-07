require 'spec_helper'

describe Package do
  it 'says its owner is a project if its a project' do
    @package = FactoryGirl.create :package_with_project
    expect(@package.owner).to eq @package.projects.first
  end

  it 'says its owner is a package if its a job' do
    @package = FactoryGirl.create :package_with_job
    expect(@package.owner).to eq @package.jobs.first
  end
end