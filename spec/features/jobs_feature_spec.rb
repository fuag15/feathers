require 'spec_helper'

feature 'list jobs' do
  background do
    @job = FactoryGirl.create :job
    visit job_category_path(@job.job_category)
  end

  scenario 'displays an job name' do
    expect(page).to have_content @job.name
  end

  scenario 'when I click an job I should be on that show path' do
    click_link @job.name
    expect(current_path).to eq job_category_job_path(@job.job_category, @job)
  end

  context 'when I click new job' do
    background do
      auth_admin
      visit job_category_path(@job.job_category)
      click_link 'create job'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new jobs path' do
      expect(current_path).to eq new_job_category_job_path(@job.job_category)
    end
  end
end

feature 'create jobs' do
  background do
    auth_admin
    @job_category = FactoryGirl.create :job_category
    visit new_job_category_job_path(@job_category)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_job_category_job_path(@job_category)
  end

  context 'when I create an job' do
    background do
      fill_in 'job_name', with: Forgery(:lorem_ipsum).word
      fill_in 'job_blurb', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Create Job'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Job Created'
    end
  end
end

feature 'edit jobs' do
  background do
    @job = FactoryGirl.create :job
    auth_admin
    visit edit_job_category_job_path(@job.job_category, @job)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_job_category_job_path(@job.job_category, @job)
  end

  context 'when I edit the job' do
    background do
      fill_in 'job_name', with: Forgery(:lorem_ipsum).word
      fill_in 'job_blurb', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Update Job'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Job Updated'
    end

    scenario 'I should be on the job path' do
      expect(current_path).to eq job_category_job_path(@job.job_category, @job)
    end
  end
end

feature 'show an job' do
  background do
    @job = FactoryGirl.create :job
    auth_admin
    visit job_category_job_path(@job.job_category, @job)
  end

  scenario 'should allow me to delete the job' do
    click_button 'destroy'
    expect(current_path).to eq job_category_path(@job.job_category)
    expect(page).to have_content 'Job Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit job page' do
      expect(current_path).to eq edit_job_category_job_path(@job.job_category, @job)
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  context 'I click pictures' do
    scenario 'I should be on the pictures path' do
      click_link 'pictures'
      expect(current_path).to eq job_pictures_path @job
    end
  end

  scenario 'when I go back I should be on the jobs page' do
    click_link 'back'
    expect(current_path).to eq job_category_path(@job.job_category)
  end
end