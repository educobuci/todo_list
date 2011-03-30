require 'spec_helper'

def create_new_user
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
end