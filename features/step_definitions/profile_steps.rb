Given /the following profiles exist/ do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  #pending # Write code here that turns the phrase above into concrete actions
  table.hashes.each do |profile|
    Profile.create(profile)
  end
end

Then(/^I should see "([^"]*)" points for "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see all my visions$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see all my tagged posts$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I am signed in as "([^"]*)" and view my profile$/) do |username|
  @user = User.find_by_username(username)
  visit profile_path(@user.id)
end

When(/^I view the profile page of "([^"]*)"$/) do |username|
  @user = User.find_by_username(username)
  visit profile_path(@user.id)
end

When(/^I can click and edit my user "([^"]*)"$/) do |arg1|
  if arg1 == "info"
    find('.edit_input_wrap', :text => 'Click on text to edit user info.').click
  elsif arg1 == "motivations"
    find('.edit_input_wrap', :text => 'Click on text to edit user motivations.').click
  else
    find('.edit_input_wrap', :text => 'Click on text to edit user priorities.').click
  end
end  
