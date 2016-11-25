Feature: Give users the ability to upadte their user information
  As a social media user
  In order to keep Visionaria a safe space
  I want to be able to flag inappropriate posts
  
  Background:
    Given   I am on the homepage
    And     the following users exist
    
      | username      | password          | email             |
      | dodobird      | dodosrule         | dodo@example.com  |
      | edasaur       | dinosaursarecool  | dino@example.com  |
     
    And     the following tagged posts exist
      
      | username  | user_id     | content       | tag             | category                        | public    |
      | dodobird  | 1           | "comments2"   | Challenge       | Quality Education               | true      |
      | edasaur   | 2           | "offensive"   | Challenge       | Quality Education               | true      |
  
    And     I am signed in with username "dodobird", email "dodo@example.com" and password "dodosrule"
    And     I look at the tagged posts
    
  Scenario: Can flag an offensive post
    Given   pending
    And     I press "Flag" on the post with content "offensive"
    Then    I should see "This post has been flag, an admin will review its contents"
    
  Scenario: Can flag a non-offensive post
    Given   pending
    And     I press "Flag" on the post with content "comments2"
    Then    I should see "This post has been flag, an admin will review its contents"