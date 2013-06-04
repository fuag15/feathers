require 'spec_helper'

feature 'list posts' do
  background do
    auth_admin
    @post = FactoryGirl.create :post
    visit posts_path
  end

  scenario 'when I click an post I should be on that show path' do
    click_link 'show'
    expect(current_path).to eq post_path @post
  end

  context 'when I click new post' do
    background do
      visit posts_path
      click_link 'create post'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new posts path' do
      expect(current_path).to eq new_post_path
    end
  end
end

feature 'create posts' do
  background do
    auth_admin
    visit new_post_path
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_post_path
  end

  context 'when I create an post' do
    background do
      fill_in 'post_title', with: Forgery(:lorem_ipsum).word
      fill_in 'post_content', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Create Post'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Post Created'
    end
  end
end

feature 'edit posts' do
  background do
    @post = FactoryGirl.create :post
    auth_admin
    visit edit_post_path @post
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_post_path @post
  end

  context 'when I edit the post' do
    background do
      fill_in 'post_title', with: Forgery(:lorem_ipsum).word
      fill_in 'post_content', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Update Post'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Post Updated'
    end

    scenario 'I should be on the post path' do
      expect(current_path).to eq post_path @post
    end
  end
end

feature 'show an post' do
  background do
    @post = FactoryGirl.create :post
    auth_admin
    visit post_path @post
  end

  scenario 'should allow me to delete the post' do
    click_button 'destroy'
    expect(current_path).to eq posts_path
    expect(page).to have_content 'Post Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit post page' do
      expect(current_path).to eq edit_post_path @post
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  context 'I click pictures' do
    scenario 'I should be on the pictures path' do
      click_link 'pictures'
      expect(current_path).to eq post_pictures_path @post
    end
  end

  scenario 'when I go back I should be on the posts page' do
    click_link 'back'
    expect(current_path).to eq root_path
  end
end