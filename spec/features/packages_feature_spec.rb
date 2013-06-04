require 'spec_helper'

feature 'list packages' do
  background do
    @package = FactoryGirl.create :package_with_project
    visit project_packages_path(@package.projects.first)
  end

  scenario 'displays an package version' do
    expect(page).to have_content @package.version
  end

  scenario 'when I click an package I should be on that show path' do
    click_link @package.file.url
    expect(current_path).to eq project_package_path(@package.projects.first, @package)
  end

  context 'when I click new package' do
    background do
      auth_admin
      visit project_packages_path(@package.projects.first)
      click_link 'create package'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new packages path' do
      expect(current_path).to eq new_project_package_path(@package.projects.first)
    end
  end
end

feature 'create packages' do
  background do
    auth_admin
    @package = FactoryGirl.create :package_with_project
    visit new_project_package_path(@package.projects.first)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_project_package_path(@package.projects.first)
  end

  context 'when I create an package' do
    background do
      fill_in 'package_version', with: Forgery(:lorem_ipsum).word
      attach_file 'package_file', Rails.root.join('spec/support/packages/waterdrop.zip')
      click_button 'Create Package'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Package Created'
    end
  end
end

feature 'edit packages' do
  background do
    @package = FactoryGirl.create :package_with_project
    auth_admin
    visit edit_project_package_path(@package.projects.first, @package)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_project_package_path(@package.projects.first, @package)
  end

  context 'when I edit the package' do
    background do
      fill_in 'package_version', with: Forgery(:lorem_ipsum).word
      attach_file 'package_file', Rails.root.join('spec/support/packages/waterdrop.zip')
      click_button 'Update Package'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Package Updated'
    end

    scenario 'I should be on the package path' do
      expect(current_path).to eq package_path @package
    end
  end
end

feature 'show an package' do
  background do
    @package = FactoryGirl.create :package_with_project
    auth_admin
    visit project_package_path(@package.projects.first, @package)
  end

  scenario 'should allow me to delete the package' do
    project = @package.projects.first
    click_button 'destroy'
    expect(current_path).to eq project_packages_path project
    expect(page).to have_content 'Package Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit package page' do
      expect(current_path).to eq edit_project_package_path(@package.projects.first, @package)
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  scenario 'when I go back I should be on the packages page' do
    click_link 'back'
    expect(current_path).to eq project_packages_path(@package.projects.first)
  end
end