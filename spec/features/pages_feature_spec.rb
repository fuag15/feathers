require 'spec_helper'

feature 'index page' do
  scenario 'displays sign in on first view' do
    visit root_path
    expect(page).to have_content 'Sign In'
  end

  scenario 'displays username and sign out when logged in' do
    auth_admin
    visit root_path
    expect(page).to have_content @user.email
    expect(page).to have_content 'Log Out'
  end
end

feature 'about page' do
  scenario 'sets about nav to be active' do
    visit about_path
    expect(page).to have_selector 'ul.nav .active', text: 'about'
  end
end

feature 'contact page' do
  scenario 'sets contact nav to be active' do
    visit contact_path
    expect(page).to have_selector 'ul.nav .active', text: 'Contact'
  end
end