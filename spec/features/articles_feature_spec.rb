require 'spec_helper'

feature 'list articles' do
  background do
    @article = FactoryGirl.create :article
    visit articles_path
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'displays an article name' do
    expect(page).to have_content @article.name
  end

  scenario 'when I click an article I should be on that show path' do
    click_link @article.name
    expect(current_path).to eq article_path @article
  end 

  context 'when I click new article' do
    background do
      auth_admin
      visit articles_path
      click_link 'create article'
    end

    scenario 'the page should not have any error messages' do
      expect(page).not_to have_selector '.alert.fade.in.alert-error'
    end

    scenario 'we should be on new articles path' do
      expect(current_path).to eq new_article_path
    end
  end
end

feature 'create articles' do
  background do
    auth_admin
    visit new_article_path
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_article_path
  end

  context 'when I create an article' do
    background do
      fill_in 'article_name', with: Forgery(:lorem_ipsum).word
      fill_in 'article_content', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Create Article'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Article Created'
    end
  end
end

feature 'edit articles' do
  background do
    @article = FactoryGirl.create :article
    auth_admin
    visit edit_article_path @article
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_article_path @article
  end

  context 'when I edit the article' do
    background do
      fill_in 'article_name', with: Forgery(:lorem_ipsum).word
      fill_in 'article_content', with: Forgery(:lorem_ipsum).paragraph
      click_button 'Update Article'
    end

    scenario 'I should see a success message' do
      expect(page).to have_content 'Article Successfully update'
    end

    scenario 'I should be on the article path' do
      expect(current_path).to eq article_path @article
    end
  end
end

feature 'show an article' do
  background do
    @article = FactoryGirl.create :article
    auth_admin
    visit article_path @article
  end

  scenario 'should allow me to delete the article' do
    click_button 'destroy'
    expect(current_path).to eq articles_path
    expect(page).to have_content 'Article Successfully Deleted'
  end

  context 'I click edit' do
    background do
      click_link 'edit'
    end

    scenario 'I should be the edit article page' do
      expect(current_path).to eq edit_article_path @article
    end

    scenario 'I should not see any errors' do
      expect(page).not_to have_selector '.alert'
    end
  end

  context 'I click images' do
    scenario 'I should be on the images path' do
      click_link 'images'
      expect(current_path).to eq article_images_path @article
    end
  end

  scenario 'when I go back I should be on the articles page' do
    click_link 'back'
    expect(current_path).to eq articles_path
  end
end