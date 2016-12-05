Feature: Give users the ability to edit and delete their own posts
  As a social media user
  In order to 
  I want to be able to edit my posts, as well as delete them
  
  Background:
    Given   I am on the homepage
    And     the following users exist
    
      | username      | password          | email             |
      | dodobird      | dodosrule         | dodo@example.com  |
      | edasaur       | dinosaursarecool  | dino@example.com  |
     
    And     the following tagged posts exist
      
      | username  | user_id     | content       | tag             | category                        | public    |
      | dodobird  | 1           | "comments2"   | Challenge       | Quality Education               | true      |
  
    And     I am signed in with username "dodobird", email "dodo@example.com" and password "dodosrule"
    And     I look at the tagged posts
    
    Scenario: Can edit my own posts
      Then  I should see the image "Edit"
      
    Scenario: Can delete my own posts
      Then  I should see the image "Delete"
      
    Scenario: Cannot edit or delete posts by other users
      Given   I log out of my account
      And     I am signed in with username "edasaur", email "dino@example.com" and password "dinosaursarecool"
      And     I look at the tagged posts
      Then    I should not see "Edit"
      And     I should not see "Delete"