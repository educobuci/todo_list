require 'acceptance/acceptance_helper'

feature 'Public lists' do
  background do
    @user = Factory.create(:user)
    @signed_user = Factory.create(:some_user)

    sign_in_as @signed_user
    
    visit user_root_url
    click_link 'Browse the public lists'
  end
  
  scenario 'Showing the public lists' do
    page.should have_content('some public list')
    page.should_not have_content('some private list')
    page.should_not have_content('home work')
  end
  
  scenario 'Showing a public list details' do
    click_link 'some public list'
    page.should have_content('some item')
  end  
end