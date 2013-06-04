require 'spec_helper'

feature 'list job_categories' do
  background do
    @job_category = FactoryGirl.create :job_category
    visit job_categories_path
  end

  scenario 'displays an job_category name' do
    expect(page).to have_content @job_category.name
  end

  scenario 'when I click an job_category I should be on that show path' do
    click_link @job_category.name
    expect(current_path).to eq job_category_path @job_category
  end

  context 'when I click new job_category' do
    background do
      auth_admin
      visit job_categories_path
      click_link 'create job category'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new job_categories path' do
      expect(current_path).to eq new_job_category_path
    end
  end
end

feature 'create job_categories' do
  background do
    auth_admin
    visit new_job_category_path
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_job_category_path
  end

  context 'when I create an job_category' do
    background do
      fill_in 'job_category_name', with: Forgery(:lorem_ipsum).word
      click_button 'Create Job category'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Job Category Created'
    end
  end
end

feature 'edit job_categories' do
  background do
    @job_category = FactoryGirl.create :job_category
    auth_admin
    visit edit_job_category_path @job_category
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_job_category_path @job_category
  end

  context 'when I edit the job_category' do
    background do
      fill_in 'job_category_name', with: Forgery(:lorem_ipsum).word
      click_button 'Update Job category'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Job Category Updated'
    end

    scenario 'I should be on the job_category path' do
      expect(current_path).to eq job_category_path @job_category
    end
  end
end

feature 'show an job_category' do
  background do
    @job_category = FactoryGirl.create :job_category
    auth_admin
    visit job_category_path @job_category
  end

  scenario 'should allow me to delete the job_category' do
    click_button 'destroy'
    expect(current_path).to eq job_categories_path
    expect(page).to have_content 'Job Category Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit job_category page' do
      expect(current_path).to eq edit_job_category_path @job_category
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  scenario 'when I go back I should be on the job_categories page' do
    click_link 'back'
    expect(current_path).to eq job_categories_path
  end
end