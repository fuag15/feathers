require 'spec_helper'

feature 'list images' do
  background do
    @image = FactoryGirl.create :image_with_article
    visit article_images_path @image.article
  end

  scenario 'displays an image name' do
    expect(page).to have_content @image.name
  end

  context 'when I click create image' do
    before do
      auth_admin
      visit article_images_path @image.article
      click_link 'create image'
    end

    scenario 'I should be on the new images path' do
      expect(current_path).to eq new_article_image_path @image.article
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  scenario 'when I click on an image I should be on the view image path' do
    click_link @image.name
    expect(current_path).to eq article_image_path(@image.article, @image)
  end
end

feature 'create an image' do
  background do
    @article = FactoryGirl.create :article
    auth_admin
    visit new_article_image_path @article
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_article_image_path @article
  end

  scenario 'should create a new article successfully from form' do
    fill_in 'image_name', with: Forgery(:lorem_ipsum).word
    attach_file 'image_file', Rails.root.join('spec/support/images/waterdrop.jpg')
    click_button 'Create Image'
    expect(page).to have_content 'Image Created'
  end
end

feature 'edit an image' do
  background do
    @image = FactoryGirl.create :image_with_article
    auth_admin
    visit edit_article_image_path(@image.article, @image)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_article_image_path(@image.article, @image)
  end

  context 'when I edit the image' do
    background do
      fill_in 'image_name', with: Forgery(:lorem_ipsum).word
      click_button 'Update Image'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Image Successfully update'
    end

    scenario 'I should be on the show path' do
      expect(current_path).to eq article_image_path(@image.article, @image)
    end
  end
end

feature 'view an image' do
  background do
    @image = FactoryGirl.create :image_with_article
    auth_admin
    visit article_image_path(@image.article, @image)
  end

  scenario 'should allow me to delete the image' do
    click_button 'destroy'
    expect(current_path).to eq article_images_path @image.article
    expect(page).to have_content 'Image Successfully Deleted'
  end

  context 'I go to edit the image' do
    background do
      click_link 'edit'
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end

    scenario 'I should be on the edit path' do
      expect(current_path).to eq edit_article_image_path(@image.article, @image)
    end
  end

  scenario 'when I click back I should be on the images path' do
    click_link 'back'
    expect(current_path).to eq article_images_path @image.article
  end
end