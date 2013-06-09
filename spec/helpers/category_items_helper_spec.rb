require 'spec_helper'

describe CategoryItemsHelper do
  before do
    @project = FactoryGirl.create :project
    @job = FactoryGirl.create :job
  end

  describe 'related_people' do
    it 'should return team whem passed project' do
      expect( related_people(@project)).to eq "Team Members: #{@project.team}"
    end

    it 'should return employer whem passed job' do
      expect( related_people(@job)).to eq "Employer: #{@job.employer}"
    end
  end
end
