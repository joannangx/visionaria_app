Feature: Give users the ability to upadte their user information
  As a social media user
  In order to express myself and reflect changes in myself
  I want to be able to update my user information
  
  Background:
    Given   I am on the homepage
    And     the following users exist
    
      | username      | password          | email             |
      | dodobird      | dodosrule         | dodo@example.com  |
  
    And     I am signed in with username "dodobird", email "dodo@example.com" and password "dodosrule"
    
  Scenario: Can update username
    Given   pending
    When    I follow "Settings"
    And     I click "Edit"
    And     I fill in "Username" with "Dodo"
    And     I press "Submit"
    Then    I should see "Dodo"
    And     I should not see "dodobird"
    
  Scenario: Can update password
    Given   pending
    When    I follow "Settings"
    And     I click "Change Password"
    And     I fill in "New Password" with "dodo123456"
    And     I fill in "New Password Confirmation" with "dodo123456"
    And     I fill in "Old Password" with "dodosrule"
    And     I press "Submit"
    Then    I should see "password change successful"
    
  Scenario: Can change user location
    Given   pending
    When    I follow "Settings"
    And     I click "Edit"
    And     I fill in "Location" with "Fajardo, Puerto Rico"
    And     I press "Submit"
    When    I view my profile
    Then    I should see "Fajardo, Puerto Rico"
    
  Scenario: Can change user avatar
    Given   pending
    When    I follow "Settings"
    And     I click "Edit"
    And     I click "Upload image" and submit a file
    And     I press "Submit"
    Then    I should see "user avatar successfully updated"