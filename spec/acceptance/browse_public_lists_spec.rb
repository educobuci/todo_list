require 'acceptance/acceptance_helper'

feature 'Browse the public lists' do
  background do
    create_new_user
    @current_user = User.first
    @current_user.lists<<Factory.create(:home_work)
    @other_user = Factory.create(:user)
    
    visit user_root_url
    click_link 'Browse the public lists'
  end
  
  scenario 'Simple browsing' do
    page.should have_content('some public list')
    page.should_not have_content('some private list')
    page.should_not have_content('home work')
  end
  
  scenario 'Accessing a public list' do
    click_link 'some public list'
    page.should have_content('some item')
  end  
end