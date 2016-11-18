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
      | edasaur   | 2           | "comments"    | Observaion      | Zero Hunger                     | true      |
      | dodobird  | 1           | "comments2"   | Challenge       | Quality Education               | true      |
      | dodobird  | 1           | "comments3"   | Challenge       | Quality Education               | true      |
  
    And     I sign in with email "dodo@example.com" and password "dodosrule"
    And     I look at the tagged posts
    
    Scenario: Can edit my own posts
      When  I choose to edit my post with "comments2"
      And   I fill in "Your Thoughts" with "edited comments"
      And   I press "Submit"
      Then  I should see "edited comments"
      And   I should not see "comments2"
      
    Scenario: Can delete my own posts
      When  I choose to delete my post with "comments3"
      Then  I should not see "comments3"
      
    Scenario: Cannot edit or delete posts by other users
      Then  I should not see an edit option for the post with "comments" by "edasaur"
      And   I should not see a delete option for the post "comments" by "edasaur"
      