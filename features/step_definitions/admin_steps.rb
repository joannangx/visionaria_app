Given /I am signed in as an admin/ do
  visit '/users/sign_up'
  fill_in "Username", :with => 'admin'
  fill_in "Email", :with => 'admin@example.com'
  fill_in "Name", :with => 'Admin Admin'
  fill_in "Password", :with => 'admin1234'
  fill_in "Password confirmation", :with => 'admin1234'
  click_button "Sign up"
  step %Q{I should see "admin"}
end