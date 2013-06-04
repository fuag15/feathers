require 'spec_helper'

describe JobCategory do
  it 'deletes any jobs associated with it' do
    @job = FactoryGirl.create :job
    expect{
      @job.job_category.destroy
    }.to change(Job,:count).by -1
  end
end
