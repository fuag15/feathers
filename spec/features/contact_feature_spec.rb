require 'spec_helper'

feature 'index page' do
  scenario 'displays the contact form' do
    auth_admin
    visit contact_path
    expect(page).to have_content 'Contact'
  end
end