require 'spec_helper'

feature 'list addresses' do
  background do
    @address = FactoryGirl.create :address
    visit addresses_path
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'displays an address name' do
    expect(page).to have_content @address.name
  end

  scenario 'when I click an address I should be on that show path' do
    click_link @address.name
    expect(current_path).to eq address_path @address
  end

  context 'when I click new address' do
    background do
      auth_admin
      visit addresses_path
      click_link 'create address'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new addresses path' do
      expect(current_path).to eq new_address_path
    end
  end
end

feature 'create addresses' do
  background do
    auth_admin
    visit new_address_path
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_address_path
  end

  context 'when I create an address' do
    background do
      fill_in 'address_name', with: Forgery(:lorem_ipsum).word
      fill_in 'address_content', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Create Article'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Article Created'
    end
  end
end

feature 'edit addresses' do
  background do
    @address = FactoryGirl.create :address
    auth_admin
    visit edit_address_path @address
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_address_path @address
  end

  context 'when I edit the address' do
    background do
      fill_in 'address_name', with: Forgery(:lorem_ipsum).word
      fill_in 'address_content', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Update Article'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Article Successfully update'
    end

    scenario 'I should be on the address path' do
      expect(current_path).to eq address_path @address
    end
  end
end

feature 'show an address' do
  background do
    @address = FactoryGirl.create :address
    auth_admin
    visit address_path @address
  end

  scenario 'should allow me to delete the address' do
    click_button 'destroy'
    expect(current_path).to eq addresses_path
    expect(page).to have_content 'Article Successfully Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit address page' do
      expect(current_path).to eq edit_address_path @address
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  context 'I click images' do
    scenario 'I should be on the images path' do
      click_link 'images'
      expect(current_path).to eq address_images_path @address
    end
  end

  scenario 'when I go back I should be on the addresses page' do
    click_link 'back'
    expect(current_path).to eq addresses_path
  end
end