require 'spec_helper'

feature 'list resume_categories' do
  background do
    @resume_category = FactoryGirl.create :resume_category
    visit resume_categories_path
  end

  scenario 'displays an resume_category name' do
    expect(page).to have_content @resume_category.name
  end

  scenario 'when I click an resume_category I should be on that show path' do
    click_link @resume_category.name
    expect(current_path).to eq resume_category_path @resume_category
  end

  context 'when I click new resume_category' do
    background do
      auth_admin
      visit resume_categories_path
      click_link 'create resume category'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new resume_categories path' do
      expect(current_path).to eq new_resume_category_path
    end
  end
end

feature 'create resume_categories' do
  background do
    auth_admin
    visit new_resume_category_path
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_resume_category_path
  end

  context 'when I create an resume_category' do
    background do
      fill_in 'resume_category_name', with: Forgery(:lorem_ipsum).word
      click_button 'Create Resume category'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Resume Category Created'
    end
  end
end

feature 'edit resume_categories' do
  background do
    @resume_category = FactoryGirl.create :resume_category
    auth_admin
    visit edit_resume_category_path @resume_category
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_resume_category_path @resume_category
  end

  context 'when I edit the resume_category' do
    background do
      fill_in 'resume_category_name', with: Forgery(:lorem_ipsum).word
      click_button 'Update Resume category'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Resume Category Updated'
    end

    scenario 'I should be on the resume_category path' do
      expect(current_path).to eq resume_category_path @resume_category
    end
  end
end

feature 'show an resume_category' do
  background do
    @resume_category = FactoryGirl.create :resume_category
    auth_admin
    visit resume_category_path @resume_category
  end

  scenario 'should allow me to delete the resume_category' do
    click_button 'destroy'
    expect(current_path).to eq resume_categories_path
    expect(page).to have_content 'Resume Category Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit resume_category page' do
      expect(current_path).to eq edit_resume_category_path @resume_category
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  scenario 'when I go back I should be on the resume_categories page' do
    click_link 'back'
    expect(current_path).to eq resume_categories_path
  end
end