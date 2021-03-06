require 'spec_helper'

feature 'list resume_entries' do
  background do
    @resume_entry = FactoryGirl.create :resume_entry
    visit resume_category_resume_entries_path(@resume_entry.resume_category)
  end

  scenario 'displays an resume_entry name' do
    expect(page).to have_content @resume_entry.name
  end

  scenario 'when I click an resume_entry I should be on that show path' do
    click_link @resume_entry.name
    expect(current_path).to eq resume_category_resume_entry_path(@resume_entry.resume_category, @resume_entry)
  end

  context 'when I click new resume_entry' do
    background do
      auth_admin
      visit resume_category_path(@resume_entry.resume_category)
      click_link 'create resume entry'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new resume_entries path' do
      expect(current_path).to eq new_resume_category_resume_entry_path(@resume_entry.resume_category)
    end
  end
end

feature 'create resume_entries' do
  background do
    auth_admin
    @resume_category = FactoryGirl.create :resume_category
    visit new_resume_category_resume_entry_path(@resume_category)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_resume_category_resume_entry_path(@resume_category)
  end

  context 'when I create an resume_entry' do
    background do
      fill_in 'resume_entry_name', with: Forgery(:lorem_ipsum).word
      click_button 'Create Resume entry'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Resume Entry Created'
    end
  end
end

feature 'edit resume_entries' do
  background do
    @resume_entry = FactoryGirl.create :resume_entry
    auth_admin
    visit edit_resume_category_resume_entry_path(@resume_entry.resume_category, @resume_entry)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_resume_category_resume_entry_path(@resume_entry.resume_category, @resume_entry)
  end

  context 'when I edit the resume_entry' do
    background do
      fill_in 'resume_entry_name', with: Forgery(:lorem_ipsum).word
      click_button 'Update Resume entry'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Resume Entry Updated'
    end

    scenario 'I should be on the resume_entry path' do
      expect(current_path).to eq resume_entry_path(@resume_entry)
    end
  end
end

feature 'show an resume_entry' do
  background do
    @resume_entry = FactoryGirl.create :resume_entry
    auth_admin
    visit resume_category_resume_entry_path(@resume_entry.resume_category, @resume_entry)
  end

  scenario 'should allow me to delete the resume_entry' do
    click_button 'destroy'
    expect(current_path).to eq resume_category_resume_entries_path(@resume_entry.resume_category)
    expect(page).to have_content 'Resume Entry Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit resume_entry page' do
      expect(current_path).to eq edit_resume_category_resume_entry_path(@resume_entry.resume_category, @resume_entry)
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  scenario 'when I go back I should be on the resume_entries page' do
    click_link 'back'
    expect(current_path).to eq resume_category_resume_entries_path(@resume_entry.resume_category)
  end
end