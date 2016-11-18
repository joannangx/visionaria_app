Given /the following users exist/ do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  #pending # Write code here that turns the phrase above into concrete actions
  table.hashes.each do |user|
    User.create(user)
  end
end

Given /^I sign up as "([^"]*)" with "([^"]*)", email "([^"]*)", and name "([^"]*)"/ do |user, password, email, name|
  visit '/users/sign_up'
  fill_in "Username", :with => user
  fill_in "Email", :with => email
  fill_in "Name", :with => name
  fill_in "Password", :with => password
  fill_in "Password confirmation", :with => password
  click_button "Sign up"
  step %Q{I should see "#{user}"}
end

Given(/^I sign up as an admin "([^"]*)" with "([^"]*)", email "([^"]*)", and name "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I choose "([^"]*)" from "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I view my setting$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am signed in with username "([^"]*)", email "([^"]*)" and password "([^"]*)"$/) do |username, email, password|
  visit '/users/sign_in'
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Log in"
  step %Q{I should see "#{username}"}
end

#Given /facebook login/  do
#  find(:css, 'a.facebook').click
#end

#Given /I should put in email "([^"]*)" and password "([^"]*)"/ do |user, password|
#  fill_in('email', with: user)
#  fill_in('pass', with: password)
#  click_button('Log In')
#end