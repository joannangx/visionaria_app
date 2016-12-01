Feature: Allow admin users to view user information/activity and download it as a .csv file
  As an admin social media username
  In order to monitor activities and ensure a safe space
  I want to be able to download data on user info/activities
  
  Background:
    Given   the following users exist

      | username      | name            | password          | email             | admin |
      | dodobird      | Joanna Ng       | dodosrule         | dodo@example.com  | false |
      | edasaur       | Ed Wang         | dinosaursarecool  | dino@example.com  | false |
      
    And     the following posts exist
      
      | username    | user_id   | content       | public    |
      | edasaur     | 2         | "comments"    | true      |
      
    And     the following tagged posts exist
      
      | username      | user_id | content       | tag               | category           | public |
      | dodobird      | 1       | "comments2"   | Zero Hunger       | Observation        | true   |
      
    And     I am signed in as an admin
    And     I am on the homepage
      
  Scenario: As an admin, I can view all user info and download
    Given   pending
    When    I follow "view user info"
    Then    I should see "Joanna Ng"
    And     I should see "dodo@example.com"
    And     I should see "dodobird"
    And     I should see "download as .csv"
  
  Scenario: As an admin, I can view all user acivity and download
    Given   pending
    When    I follow "view user activity"
    Then    I should see "comments"
    And     I should see "comments2"
    And     I should see "download as .csv"