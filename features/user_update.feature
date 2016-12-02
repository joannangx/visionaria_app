Feature: Give users the ability to upadte their user information
  As a social media user
  In order to express myself and reflect changes in myself
  I want to be able to update my user information
  
  Background:
    Given   I am on the homepage
    And     the following users exist
    
      | username      | password          | email             |
      | dodobird      | dodosrule         | dodo@example.com  |
    
    And   the following profiles exist
      | user_id       |
      | 1             |
  
    And     I am signed in with username "dodobird", email "dodo@example.com" and password "dodosrule"
    
  Scenario: Can update username
    When    I follow "User Info"
    And     I fill in "Username" with "Dodo"
    And     I fill in "Current password" with "dodosrule"
    And     I press "Update"
    Then    I should see "Dodo"
    And     I should not see "dodobird"
    
  Scenario: Can change user location
    When    I follow "User Info"
    And     I fill in "Location" with "Fajardo, Puerto Rico"
    And     I fill in "Current password" with "dodosrule"
    And     I press "Update"
    And     I follow "Profile"
    Then    I should see "Fajardo, Puerto Rico"
    
  Scenario: Can change user avatar
    When    I follow "User Info"
    Then    I should see "Avatar" 
    
  Scenario: Can update password
    When    I follow "User Info"
    And     I fill in "Password" with "dodo123456"
    And     I fill in "Password confirmation" with "dodo123456"
    And     I fill in "Current password" with "dodosrule"
    And     I press "Update"
    
