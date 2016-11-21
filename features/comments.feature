Feature: Make Comments
  As a social media user
  In order to express my views about other people's posts
  I want to make comments
  
Background:
    Given I am on the home page
    And   the following users exist
    
      | username      | name        | password          | email             |
      | dodobird      | Joanna Ng   | dodosrule         | dodo@example.com  |
      | edasaur       | Ed Wang     | dinosaursarecool  | dino@example.com  |
    
    And   the following tagged posts exist
      
      | username  | user_id     | content       | tag             | category                        | public    |
      | dodobird  | 1           | "comments2"   | Challenge       | Quality Education               | true      |
    
    And   the following posts exist
      
      | username  | user_id     | content       | public    |
      | edasaur   | 2           | "content1"    | true      |
      | dodo      | 1           | "content2"    | true      |
    
    And   the following comments exist
      | username  | body          | post_id         |
      | akira     | Love U        | 1               |
  
    And   I sign up as "dodo" with "dodosrule", email "dodo@dodo.com", and name "Dodo"
    
    Scenario: Successfully make a post comment with username
      When  I follow "1 Comments"
      And   I fill in "Your Comment" with "Good"
      And   I press "Create"
      Then  I should see "Good"
      And   I should see "dodo"
      When  I am on the home page
      Then  I should see "2 Comments"
      
    Scenario: Successfully make a post comment anonymously
      When  I follow "0 Comments"
      And   I fill in "Your Comment" with "Secret"
      And   I check "Anonymous"
      And   I press "Create"
      Then  I should see "Anonymous"
      
    Scenario: Successfully make a tagged post comment with username
      When  I follow "PROGRESO"
      When  I follow "0 Comments"
      And   I fill in "Your Comment" with "Good"
      And   I press "Create"
      Then  I should see "Good"
      And   I should see "dodo"
      When  I look at the tagged posts
      Then  I should see "1 Comments"
      
    Scenario: Successfully make a tagged post comment anonymously
      When  I follow "PROGRESO"  
      When  I follow "0 Comments"
      And   I fill in "Your Comment" with "Secret"
      And   I check "Anonymous"
      And   I press "Create"
      Then  I should see "Anonymous"
      