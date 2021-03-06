require 'spec_helper'

feature 'list addresses' do
  background do
    @address = FactoryGirl.create :address
    visit addresses_path
  end

  scenario 'displays an address street' do
    expect(page).to have_content @address.street
  end

  scenario 'when I click an address I should be on that show path' do
    click_link @address.street
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

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_address_path
  end

  context 'when I create an address' do
    background do
      fill_in 'address_phone', with: Forgery(:lorem_ipsum).word
      fill_in 'address_street', with: Forgery(:lorem_ipsum).word
      fill_in 'address_city', with: Forgery(:lorem_ipsum).word
      click_button 'Create Address'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Address Created'
    end
  end
end

feature 'edit addresses' do
  background do
    @address = FactoryGirl.create :address
    auth_admin
    visit edit_address_path @address
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_address_path @address
  end

  context 'when I edit the address' do
    background do
      fill_in 'address_phone', with: Forgery(:lorem_ipsum).word
      fill_in 'address_street', with: Forgery(:lorem_ipsum).word
      fill_in 'address_city', with: Forgery(:lorem_ipsum).word
      click_button 'Update Address'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Address Updated'
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
    expect(page).to have_content 'Address Deleted'
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

  scenario 'when I go back I should be on the addresses page' do
    click_link 'back'
    expect(current_path).to eq addresses_path
  end
end