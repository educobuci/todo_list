require 'acceptance/acceptance_helper'

feature 'User sign-up' do
  background do
    create_new_user
  end
  
  scenario 'Registrationwith photo' do 
    page.should have_content('Welcome! You have signed up successfully.')
    page.should have_selector(:xpath, "//img[contains(@src, 'rails.png')]")
  end
end