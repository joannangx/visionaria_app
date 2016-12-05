Feature: Add tags to posts
  As a social media user
  In order to organize my posts
  I want to be able to add tags to my posts
  
  Background:
    Given I am on the homepage
    And   the following users exist
  
      | username      | name            | password          | email             |
      | dodobird      | Joanna Ng       | dodosrule         | dodo@example.com  |
      | edasaur       | Ed Wang         | dinosaursarecool  | dino@example.com  |
    
    And   the following tagged posts exist
       
      | username  | user_id       | content       | tag             | category                        | public  |
      | edasaur   | 2             | "comments"    | Observation     | Zero Hunger                     | true    |
      | dodobird  | 1             | "comments2"   | Challenge       | Quality Education               | true    |
  
    And   I sign up as "dodo" with "dodosrule", email "dodo@dodo.com", and name "Dodo"
    And   I look at the tagged posts
    
  Scenario: Create a new post with tags
    When  I fill in "content_area" with "comments3"
    Then  I should see "Category"
    And   I should see "Sustainable UN Goal"