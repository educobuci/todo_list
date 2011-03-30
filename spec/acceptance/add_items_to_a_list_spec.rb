require 'acceptance/acceptance_helper'

feature 'Add items to a list' do
  background do
    create_new_user
    @user = User.first
    @user.lists<<List.create!(:name => "dummy list")
  end
  
  scenario 'Regular item creation' do
    visit list_path(@user.lists[0])
    fill_in '#name', :with => 'dummy item'
    click_link_or_button 'Add item'
    page.should have_content('dummy item')
  end
  
end