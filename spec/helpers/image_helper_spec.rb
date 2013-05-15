require 'spec_helper'

describe ImageHelper do
  before do
    @article_image = FactoryGirl.create :image_with_article
    #@project_image = FactoryGirl.create :image_with_project
    @article = @article_image.article
    #@project = @project_image.project
  end

  describe 'owner_aware_edit_image_path' do
    it 'should return edit_article_image_path when passed article' do
      expect( owner_aware_edit_image_path(@article, @article_image)).to eq edit_article_image_path(@article, @article_image)
    end

    #it 'should return edit_project_image_path when passed project' do
    #  expect( owner_aware_edit_image_path(@project, @project_image)).to eq edit_project_image_path(@project, @project_image)
    #end
  end

  describe 'owner_aware_images_path' do
    it 'should return edit_article_images_path when passed article' do
      expect( owner_aware_images_path @article ).to eq article_images_path @article
    end

    #it 'should return edit_project_images_path when passed project' do
    #  expect( owner_aware_images_path @project ).to eq project_images_path @project
    #end
  end

  describe 'owner_aware_new_image_path' do
    it 'should return new_article_image_path when passed article' do
      expect( owner_aware_new_image_path @article).to eq new_article_image_path @article
    end

    #it 'should return new_project_image_path when passed project' do
    #  expect( owner_aware_new_image_path @project).to eq new_project_image_path @project
    #end
  end
end
