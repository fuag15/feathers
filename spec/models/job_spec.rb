require 'spec_helper'

describe Job do
  it 'deletes any pictures associated with it' do
    @picture = FactoryGirl.create :picture_with_job
    expect{
      @picture.jobs.first.destroy
    }.to change(Picture,:count).by -1
  end

  it 'deletes any packages associated with it' do
    @picture = FactoryGirl.create :package_with_job
    expect{
      @picture.jobs.first.destroy
    }.to change(Package,:count).by -1
  end
end
