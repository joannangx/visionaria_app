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

# Then /^I should be able to delete the post "([^"]*)"$/ do |content|
#   step %Q{I should see "Delete"}
#   click_link "Delete"
#   page.accept_confirm do
#     click_button('Yes')
#   end
#   step %Q{I should not see #{content}}
# end