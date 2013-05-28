require 'spec_helper'

feature 'list packages' do
  background do
    @package = FactoryGirl.create :package
    visit project_packages_path(@package.project)
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'displays an package name' do
    expect(page).to have_content @package.name
  end

  scenario 'when I click an package I should be on that show path' do
    click_link @package.name
    expect(current_path).to eq project_package_path(@package.project, @package)
  end

  context 'when I click new package' do
    background do
      auth_admin
      visit project_packages_path(@package.project)
      click_link 'create package'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new packages path' do
      expect(current_path).to eq new_project_package_path(@package.project)
    end
  end
end

feature 'create packages' do
  background do
    auth_admin
    visit new_project_package_path(@package.project)
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_project_package_path(@package.project)
  end

  context 'when I create an package' do
    background do
      fill_in 'package_name', with: Forgery(:lorem_ipsum).word
      fill_in 'package_content', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Create Article'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Article Created'
    end
  end
end

feature 'edit packages' do
  background do
    @package = FactoryGirl.create :package
    auth_admin
    visit edit_project_package_path(@package.project, @package)
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_project_package_path(@package.project, @package)
  end

  context 'when I edit the package' do
    background do
      fill_in 'package_name', with: Forgery(:lorem_ipsum).word
      fill_in 'package_content', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Update Article'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Article Successfully update'
    end

    scenario 'I should be on the package path' do
      expect(current_path).to eq project_package_path(@package.project, @package)
    end
  end
end

feature 'show an package' do
  background do
    @package = FactoryGirl.create :package
    auth_admin
    visit project_package_path(@package.project, @package)
  end

  scenario 'should allow me to delete the package' do
    click_button 'destroy'
    expect(current_path).to eq project_packages_path(@package.project)
    expect(page).to have_content 'Article Successfully Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit package page' do
      expect(current_path).to eq edit_project_package_path(@package.project, @package)
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  context 'I click images' do
    scenario 'I should be on the images path' do
      click_link 'images'
      expect(current_path).to eq package_images_path @package
    end
  end

  scenario 'when I go back I should be on the packages page' do
    click_link 'back'
    expect(current_path).to eq project_packages_path(@package.project)
  end
end