Feature: Like posts
  As a social media user
  In order to express my views about other people's posts
  I want to like other people's posts
  
Background:
    Given   I am on the home page
    And     the following users exist
    
      | username      | name        | password          | email             |
      | dodobird      | Joanna Ng   | dodosrule         | dodo@example.com  |
      | edasaur       | Ed Wang     | dinosaursarecool  | dino@example.com  |
    
    And     the following tagged posts exist
      
      | username  | user_id     | content       | tag             | category                        | public    |
      | dodobird  | 1           | "comments2"   | Challenge       | Quality Education               | true      |
    
    And     the following posts exist
      
      | username  | user_id     | content       | public    |
      | edasaur   | 2           | "content1"    | true      |
    
    And     I sign up as "dodo" with "dodosrule", email "dodo@dodo.com", and name "Dodo"
    
    Scenario: Successfully like and unlike a post
      When  I follow image link "like"
      Then  I should see "You liked the post!"
      And   I should see "1"
      When  I follow image link "unlike"
      Then  I should see "You unliked the post!"
      And   I should see "0"
    
    Scenario: Successfully like and unlike a tagged post
      When  I follow "PROGRESO"
      And   I follow image link "like"
      Then  I should see "You liked the post!"
      And   I should see "1"
      When  I follow image link "unlike"
      Then  I should see "You unliked the post!"
      And   I should see "0"