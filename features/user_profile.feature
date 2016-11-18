Feature: User Profiles
  As a social media user
  In order to share my likes and interests with others
  I want to view and edit my profile page
  
  Background:
    Given   I am on the home page
    And     the following users exist
    
      | username      | name            | password          | email             |
      | dodobird      | Joanna Ng       | dodosrule         | dodo@example.com  |
      | edasaur       | Ed Wang         | dinosaursarecool  | dino@example.com  |
    
    And   the following profiles exist
      | user_id       |
      | 1             |
      | 2             |
    
    And     the following posts exist
      
      | username      | user_id     | content       | public    |
      | edasaur       | 2           | "comments"    | true      |
      | dodobird      | 1           | "comments2"   | true      |
      | dodobird      | 1           | "comments3"   | true      |
  
    And   I sign up as "dodo" with "dodosrule", email "dodo@dodo.com", and name "Dodo"
    
    Scenario: Can view my own profile
      When  I am signed in as "dodo" and view my profile
      Then  I should see "dodo"
      
    Scenario: Can edit my own profile
      When  I am signed in as "dodo" and view my profile
      Then  I should see "Click on text to edit user info."
      And   I should see "Click on text to edit user motivations."
      And   I should see "Click on text to edit user priorities."
      Then  I can click and edit my user "info"
      And   I can click and edit my user "motivations"
      And   I can click and edit my user "priorities"
      
    Scenario: Cannot edit profiles of other users
      Given I am on the home page
      When  I view the profile page of "edasaur"
      Then  I should not see "Click on text to edit user info."
      And   I should not see "Click on text to edit user motivations."
      And   I should not see "Click on text to edit user priorities."