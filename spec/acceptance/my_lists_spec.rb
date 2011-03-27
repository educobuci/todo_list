require 'acceptance/acceptance_helper'

feature 'My lists' do
  background do
    create_new_user
    @user = User.first
    @user.lists<<List.create!(:name => 'test list')
    @user.lists<<List.create!(:name => 'another list')
  end
  
  scenario 'Browse my lists' do
    visit user_root_url
    page.should have_content('test list')
    page.should have_content('another list')
  end
  
end