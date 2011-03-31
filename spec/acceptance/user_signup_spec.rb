require 'acceptance/acceptance_helper'

feature 'User sign up' do
  scenario 'Sign up specifing an avatar image' do
    visit '/'
    click_link 'Sign Up'
    within '#user_new' do
      fill_in 'Name', :with => 'Bob Marley'
      fill_in 'Email', :with => 'bob@example.com'
      fill_in 'Password', :with => '123456'
      fill_in 'Password confirmation', :with => '123456'
    end

    page.attach_file 'user_avatar', 'public/images/rails.png'

    click_link_or_button 'Sign up'
     
    page.should have_content('Welcome! You have signed up successfully.')
    page.should have_selector(:xpath, "//img[contains(@src, 'rails.png')]")
  end
end