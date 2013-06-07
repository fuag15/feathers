require 'spec_helper'

describe PackagesHelper do
  before do
    @project_package = FactoryGirl.create :package_with_project
    @job_package = FactoryGirl.create :package_with_job
  end

  describe 'owner_aware_edit_package_path' do
    it 'should return edit_project_package_path when passed project' do
      expect( owner_aware_edit_package_path(@project_package.projects.first, @project_package)).to eq edit_project_package_path(@project_package.projects.first, @project_package)
    end

    it 'should return edit_job_package_path when passed job' do
      expect( owner_aware_edit_package_path(@job_package.jobs.first, @job_package)).to eq edit_job_package_path(@job_package.jobs.first, @job_package)
    end
  end

  describe 'owner_aware_packages_path' do
    it 'should return edit_project_packages_path when passed project' do
      expect( owner_aware_packages_path @project_package.projects.first ).to eq project_packages_path @project_package.projects.first
    end

    it 'should return edit_job_packages_path when passed job' do
      expect( owner_aware_packages_path @job_package.jobs.first ).to eq job_packages_path @job_package.jobs.first
    end
  end

  describe 'owner_aware_new_package_path' do
    it 'should return new_post_package_path when passed project' do
      expect( owner_aware_new_package_path @project_package.projects.first).to eq new_project_package_path @project_package.projects.first
    end

    it 'should return new_post_package_path when passed job' do
      expect( owner_aware_new_package_path @job_package.jobs.first).to eq new_job_package_path @job_package.jobs.first
    end
  end
end
