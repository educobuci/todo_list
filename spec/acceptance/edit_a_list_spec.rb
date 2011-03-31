require 'acceptance/acceptance_helper'

feature 'Create a new list' do
  background do
    @user = Factory.create(:user)
    @other_user = Factory.create(:some_user)
    sign_in_as @user    
  end
  
  scenario 'Editing a list from another user' do
    visit edit_list_path(@other_user.lists.first)
    page.should have_content('Access denied')
  end
end