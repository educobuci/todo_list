require 'acceptance/acceptance_helper'

feature 'My lists' do
  background do
    @user = Factory.create(:user)
    sign_in_as @user
  end
  
  scenario 'Browse my lists' do
    visit user_root_url
    page.should have_content('some public list')
    page.should have_content('some private list')
  end
  
end