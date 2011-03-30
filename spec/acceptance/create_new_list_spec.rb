require 'acceptance/acceptance_helper'

feature 'Create new list' do
  background do
    create_new_user
    @user = User.first
  end
  
  scenario 'Regular list creation' do
    click_link 'Create new list'
    within('#new_list') do
      fill_in 'Name', :with => 'work tasks'
      fill_in 'list_items_attributes_0_name', :with => 'dummy item'
    end
    click_link_or_button 'Create'
    page.should have_content('The list has been created successfully')
    
    page.should have_selector(:xpath, "//input[@value='work tasks']")
    page.should have_selector(:xpath, "//input[@value='dummy item']")
  end
end