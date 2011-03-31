require 'spec_helper'

def sign_in_as(user)
  visit '/'
  click_link 'Sign In'
  within '#user_new' do
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
  end
    
  click_link_or_button 'Sign in'
end