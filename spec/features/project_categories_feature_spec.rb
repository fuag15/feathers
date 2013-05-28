require 'spec_helper'

feature 'list project_categories' do
  background do
    @project_category = FactoryGirl.create :project_category
    visit project_categories_path
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'displays an project_category name' do
    expect(page).to have_content @project_category.name
  end

  scenario 'when I click an project_category I should be on that show path' do
    click_link @project_category.name
    expect(current_path).to eq project_category_path @project_category
  end

  context 'when I click new project_category' do
    background do
      auth_admin
      visit project_categories_path
      click_link 'create project_category'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new project_categories path' do
      expect(current_path).to eq new_project_category_path
    end
  end
end

feature 'create project_categories' do
  background do
    auth_admin
    visit new_project_category_path
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_project_category_path
  end

  context 'when I create an project_category' do
    background do
      fill_in 'project_category_name', with: Forgery(:lorem_ipsum).word
      fill_in 'project_category_content', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Create Article'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Article Created'
    end
  end
end

feature 'edit project_categories' do
  background do
    @project_category = FactoryGirl.create :project_category
    auth_admin
    visit edit_project_category_path @project_category
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_project_category_path @project_category
  end

  context 'when I edit the project_category' do
    background do
      fill_in 'project_category_name', with: Forgery(:lorem_ipsum).word
      fill_in 'project_category_content', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Update Article'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Article Successfully update'
    end

    scenario 'I should be on the project_category path' do
      expect(current_path).to eq project_category_path @project_category
    end
  end
end

feature 'show an project_category' do
  background do
    @project_category = FactoryGirl.create :project_category
    auth_admin
    visit project_category_path @project_category
  end

  scenario 'should allow me to delete the project_category' do
    click_button 'destroy'
    expect(current_path).to eq project_categories_path
    expect(page).to have_content 'Article Successfully Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit project_category page' do
      expect(current_path).to eq edit_project_category_path @project_category
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  context 'I click images' do
    scenario 'I should be on the images path' do
      click_link 'images'
      expect(current_path).to eq project_category_images_path @project_category
    end
  end

  scenario 'when I go back I should be on the project_categories page' do
    click_link 'back'
    expect(current_path).to eq project_categories_path
  end
end