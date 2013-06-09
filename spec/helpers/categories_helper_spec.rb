require 'spec_helper'

describe CategoriesHelper do
  before do
    @project_category = FactoryGirl.create :project_category_with_projects
    @job_category = FactoryGirl.create :job_category_with_jobs
  end

  describe 'category_items' do
    it 'should return projects whem passed project_category' do
      expect( category_items(@project_category)).to eq @project_category.projects
    end

    it 'should return jobs whem passed job_category' do
      expect( category_items(@job_category)).to eq @job_category.jobs
    end
  end
end

