Feature: Enable user notifications -> Ethan
  As a social media user
  In order to stay up to date with what people think about my posts
  I want to be able to get user notifications for when someone likes or comments on my posts

  Background:
    Given   I am on the homepage
    And     the following users exist
    
      | username      | password          | email             |
      | dodobird      | dodosrule         | dodo@example.com  |
      | edasaur       | dinosaursarecool  | dino@example.com  |
     
    And     the following tagged posts exist
      
      | username  | user_id     | content       | tag             | category                        | public    |
      | dodobird  | 1           | "comments2"   | Challenge       | Quality Education               | true      |
    
    And   the following posts exist
      
      | username    | user_id   | content       | public    |
      | dodobird    | 1         | "comments"    | true      |
  
    And     I am signed in with username "edasaur", email "dino@example.com" and password "dinosaursarecool"
    And     I comment on the tagged post
    And     I like the untagged post
    And     I log out of my account
    And     I am signed in with username "dodobird", email "dodo@example.com" and password "dodosrule"
  
  Scenario: Get notification for a comment on my post
    When    I follow "Notifications"
    Then    I should get a notification for a "comment" by "edasaur"
    
  Scenario: Get notification for a like on my post
    When    I follow "Notifications"
    Then    I should get a notification for a "like" by "edasaur"