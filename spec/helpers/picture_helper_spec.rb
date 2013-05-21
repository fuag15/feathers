require 'spec_helper'

describe PictureHelper do
  before do
    @post_picture = FactoryGirl.create :picture_with_post
    @project_picture = FactoryGirl.create :picture_with_project
    @job_picture = FactoryGirl.create :picture_with_job
  end

  describe 'owner_aware_edit_picture_path' do
    it 'should return edit_post_picture_path when passed post' do
      expect( owner_aware_edit_picture_path(@post_picture.post, @post_picture)).to eq edit_post_picture_path(@post_picture.post, @post_picture)
    end

    it 'should return edit_project_picture_path when passed project' do
      expect( owner_aware_edit_picture_path(@project_picture.project, @project_picture)).to eq edit_project_picture_path(@project_picture.project, @project_picture)
    end

    it 'should return edit_job_picture_path when passed job' do
      expect( owner_aware_edit_picture_path(@job_picture.job, @job_picture)).to eq edit_job_picture_path(@job_picture.job, @job_picture)
    end
  end

  describe 'owner_aware_pictures_path' do
    it 'should return edit_post_pictures_path when passed post' do
      expect( owner_aware_pictures_path @post_picture.post ).to eq post_pictures_path @post_picture.post
    end

    it 'should return edit_project_pictures_path when passed project' do
      expect( owner_aware_pictures_path @project_picture.project ).to eq project_pictures_path @project_picture.project
    end

    it 'should return edit_job_pictures_path when passed job' do
      expect( owner_aware_pictures_path @job_picture.job ).to eq job_pictures_path @job_picture.job
    end
  end

  describe 'owner_aware_new_picture_path' do
    it 'should return new_post_picture_path when passed post' do
      expect( owner_aware_new_picture_path @post_picture.post).to eq new_post_picture_path @post_picture.post
    end

    it 'should return new_post_picture_path when passed project' do
      expect( owner_aware_new_picture_path @project_picture.project).to eq new_project_picture_path @project_picture.project
    end

    it 'should return new_post_picture_path when passed job' do
      expect( owner_aware_new_picture_path @job_picture.job).to eq new_job_picture_path @job_picture.job
    end
  end
end
