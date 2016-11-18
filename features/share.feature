Feature: Share on social button Facebook
  As a social media user
  In order to share inspiring posts on Visionaria with friends on other social media platforms
  I want to be able to share posts on Facebook
  
  Background:
    Given I am on the homepage
    And   the following users exist

      | username      | name            | password          | email             |
      | dodobird      | Joanna Ng       | dodosrule         | dodo@example.com  |
      | edasaur       | Ed Wang         | dinosaursarecool  | dino@example.com  |
    
    And   the following tagged posts exist
      
      | username  | user_id     | content       | tag               | category           | public    |
      | edasaur   | 2           | "comments"    | Zero Hunger       | Observation        | true      |
  
    And   I sign up as "dodo" with "dodosrule", email "dodo@dodo.com", and name "Dodo"
    And   I look at the tagged posts
    
    Scenario: Share an existing post