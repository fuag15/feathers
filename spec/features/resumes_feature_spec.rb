require 'spec_helper'

feature 'display resume' do
  background do
    @resume_entry = FactoryGirl.create :resume_entry
    @address = FactoryGirl.create :address
    visit resume_path
  end

  scenario 'displays an address' do
    expect(page).to have_content @address.city
  end

  scenario 'displays an resume_entry name' do
    expect(page).to have_content @resume_entry.name
  end

  scenario 'displays an resume_category name' do
    expect(page).to have_content @resume_entry.resume_category.name
  end
end