require 'spec_helper'

feature 'list pictures of a post' do
  background do
    @picture = FactoryGirl.create :picture_with_post
    visit post_pictures_path @picture.posts.first
  end

  scenario 'displays an picture name' do
    expect(page).to have_content @picture.name
  end

  context 'when I click create picture' do
    before do
      auth_admin
      visit post_pictures_path @picture.posts.first
      click_link 'create picture'
    end

    scenario 'I should be on the new pictures path' do
      expect(current_path).to eq new_post_picture_path @picture.posts.first
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  scenario 'when I click on an picture I should be on the view picture path' do
    click_link @picture.image.url
    expect(current_path).to eq post_picture_path(@picture.posts.first, @picture)
  end
end

feature 'create an picture with a post' do
  background do
    @post = FactoryGirl.create :post
    auth_admin
    visit new_post_picture_path @post
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_post_picture_path @post
  end

  scenario 'should create a new post successfully from form' do
    fill_in 'picture_name', with: Forgery(:lorem_ipsum).word
    attach_file 'picture_image', Rails.root.join('spec/support/pictures/waterdrop.jpg')
    click_button 'Create Picture'
    expect(page).to have_content 'Picture Created'
  end
end

feature 'edit an picture of a post' do
  background do
    @picture = FactoryGirl.create :picture_with_post
    auth_admin
    visit edit_post_picture_path(@picture.posts.first, @picture)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_post_picture_path(@picture.posts.first, @picture)
  end

  context 'when I edit the picture' do
    background do
      fill_in 'picture_name', with: Forgery(:lorem_ipsum).word
      click_button 'Update Picture'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Picture Updated'
    end

    scenario 'I should be on the show path' do
      expect(current_path).to eq post_picture_path(@picture.posts.first, @picture)
    end
  end
end

feature 'view an picture of a post' do
  background do
    @picture = FactoryGirl.create :picture_with_post
    auth_admin
    visit post_picture_path(@picture.posts.first, @picture)
  end

  scenario 'should allow me to delete the picture' do
    post = @picture.posts.first
    click_button 'destroy'
    expect(current_path).to eq post_pictures_path post
    expect(page).to have_content 'Picture Deleted'
  end

  context 'I go to edit the picture' do
    background do
      click_link 'edit'
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end

    scenario 'I should be on the edit path' do
      expect(current_path).to eq edit_post_picture_path(@picture.posts.first, @picture)
    end
  end

  scenario 'when I click back I should be on the pictures path' do
    click_link 'back'
    expect(current_path).to eq post_pictures_path @picture.posts.first
  end
end

feature 'list pictures of a project' do
  background do
    @picture = FactoryGirl.create :picture_with_project
    visit project_pictures_path @picture.projects.first
  end

  scenario 'displays an picture name' do
    expect(page).to have_content @picture.name
  end

  context 'when I click create picture' do
    before do
      auth_admin
      visit project_pictures_path @picture.projects.first
      click_link 'create picture'
    end

    scenario 'I should be on the new pictures path' do
      expect(current_path).to eq new_project_picture_path @picture.projects.first
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  scenario 'when I click on an picture I should be on the view picture path' do
    click_link @picture.image.url
    expect(current_path).to eq project_picture_path(@picture.projects.first, @picture)
  end
end

feature 'create an picture with a project' do
  background do
    @project = FactoryGirl.create :project
    auth_admin
    visit new_project_picture_path @project
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_project_picture_path @project
  end

  scenario 'should create a new project successfully from form' do
    fill_in 'picture_name', with: Forgery(:lorem_ipsum).word
    attach_file 'picture_image', Rails.root.join('spec/support/pictures/waterdrop.jpg')
    click_button 'Create Picture'
    expect(page).to have_content 'Picture Created'
  end
end

feature 'edit an picture of a project' do
  background do
    @picture = FactoryGirl.create :picture_with_project
    auth_admin
    visit edit_project_picture_path(@picture.projects.first, @picture)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_project_picture_path(@picture.projects.first, @picture)
  end

  context 'when I edit the picture' do
    background do
      fill_in 'picture_name', with: Forgery(:lorem_ipsum).word
      click_button 'Update Picture'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Picture Updated'
    end

    scenario 'I should be on the show path' do
      expect(current_path).to eq project_picture_path(@picture.projects.first, @picture)
    end
  end
end

feature 'view an picture of a project' do
  background do
    @picture = FactoryGirl.create :picture_with_project
    auth_admin
    visit project_picture_path(@picture.projects.first, @picture)
  end

  scenario 'should allow me to delete the picture' do
    project = @picture.projects.first
    click_button 'destroy'
    expect(current_path).to eq project_pictures_path project
    expect(page).to have_content 'Picture Deleted'
  end

  context 'I go to edit the picture' do
    background do
      click_link 'edit'
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end

    scenario 'I should be on the edit path' do
      expect(current_path).to eq edit_project_picture_path(@picture.projects.first, @picture)
    end
  end

  scenario 'when I click back I should be on the pictures path' do
    click_link 'back'
    expect(current_path).to eq project_pictures_path @picture.projects.first
  end
end

feature 'list pictures of a job' do
  background do
    @picture = FactoryGirl.create :picture_with_job
    visit job_pictures_path @picture.jobs.first
  end

  scenario 'displays an picture name' do
    expect(page).to have_content @picture.name
  end

  context 'when I click create picture' do
    before do
      auth_admin
      visit job_pictures_path @picture.jobs.first
      click_link 'create picture'
    end

    scenario 'I should be on the new pictures path' do
      expect(current_path).to eq new_job_picture_path @picture.jobs.first
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  scenario 'when I click on an picture I should be on the view picture path' do
    click_link @picture.image.url
    expect(current_path).to eq job_picture_path(@picture.jobs.first, @picture)
  end
end

feature 'create an picture with a job' do
  background do
    @job = FactoryGirl.create :job
    auth_admin
    visit new_job_picture_path @job
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_job_picture_path @job
  end

  scenario 'should create a new job successfully from form' do
    fill_in 'picture_name', with: Forgery(:lorem_ipsum).word
    attach_file 'picture_image', Rails.root.join('spec/support/pictures/waterdrop.jpg')
    click_button 'Create Picture'
    expect(page).to have_content 'Picture Created'
  end
end

feature 'edit an picture of a job' do
  background do
    @picture = FactoryGirl.create :picture_with_job
    auth_admin
    visit edit_job_picture_path(@picture.jobs.first, @picture)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_job_picture_path(@picture.jobs.first, @picture)
  end

  context 'when I edit the picture' do
    background do
      fill_in 'picture_name', with: Forgery(:lorem_ipsum).word
      click_button 'Update Picture'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Picture Updated'
    end

    scenario 'I should be on the show path' do
      expect(current_path).to eq job_picture_path(@picture.jobs.first, @picture)
    end
  end
end

feature 'view an picture of a job' do
  background do
    @picture = FactoryGirl.create :picture_with_job
    auth_admin
    visit job_picture_path(@picture.jobs.first, @picture)
  end

  scenario 'should allow me to delete the picture' do
    job = @picture.jobs.first
    click_button 'destroy'
    expect(current_path).to eq job_pictures_path job
    expect(page).to have_content 'Picture Deleted'
  end

  context 'I go to edit the picture' do
    background do
      click_link 'edit'
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end

    scenario 'I should be on the edit path' do
      expect(current_path).to eq edit_job_picture_path(@picture.jobs.first, @picture)
    end
  end

  scenario 'when I click back I should be on the pictures path' do
    click_link 'back'
    expect(current_path).to eq job_pictures_path @picture.jobs.first
  end
end