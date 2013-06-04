require 'spec_helper'

feature 'list projects' do
  background do
    @project = FactoryGirl.create :project
    visit project_category_path @project.project_category
  end

  scenario 'displays an project name' do
    expect(page).to have_content @project.name
  end

  scenario 'when I click an project I should be on that show path' do
    click_link @project.name
    expect(current_path).to eq project_category_project_path(@project.project_category, @project)
  end

  context 'when I click new project' do
    background do
      auth_admin
      visit project_category_path(@project.project_category)
      click_link 'create project'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new projects path' do
      expect(current_path).to eq new_project_category_project_path(@project.project_category)
    end
  end
end

feature 'create projects' do
  background do
    auth_admin
    @project = FactoryGirl.create :project
    visit new_project_category_project_path(@project.project_category)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_project_category_project_path(@project.project_category)
  end

  context 'when I create an project' do
    background do
      fill_in 'project_name', with: Forgery(:lorem_ipsum).word
      fill_in 'project_blurb', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Create Project'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Project Created'
    end
  end
end

feature 'edit projects' do
  background do
    @project = FactoryGirl.create :project
    auth_admin
    visit edit_project_category_project_path(@project.project_category, @project)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_project_category_project_path(@project.project_category, @project)
  end

  context 'when I edit the project' do
    background do
      fill_in 'project_name', with: Forgery(:lorem_ipsum).word
      fill_in 'project_blurb', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Update Project'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Project Updated'
    end

    scenario 'I should be on the project path' do
      expect(current_path).to eq project_category_project_path(@project.project_category, @project)
    end
  end
end

feature 'show an project' do
  background do
    @project = FactoryGirl.create :project
    auth_admin
    visit project_category_project_path(@project.project_category, @project)
  end

  scenario 'should allow me to delete the project' do
    click_button 'destroy'
    expect(current_path).to eq project_category_path(@project.project_category)
    expect(page).to have_content 'Project Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit project page' do
      expect(current_path).to eq edit_project_category_project_path(@project.project_category, @project)
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  context 'I click pictures' do
    scenario 'I should be on the pictures path' do
      click_link 'pictures'
      expect(current_path).to eq project_pictures_path @project
    end
  end
end