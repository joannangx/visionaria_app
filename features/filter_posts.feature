Feature: Filter posts by 17 Sustainable Development Goals (Category)
  As a social media user
  In order to learn more about what others have to say about the 17 Sustainable Development Goals
  I want to be able to filter posts by the 17 Sustainable Development Goals
  
  Background:
    Given I am on the homepage
    And   the following users exist
    
      | username      | password          | email             |
      | dodobird      | dodosrule         | dodo@example.com  |
      | edasaur       | dinosaursarecool  | dino@example.com  |
     
    And   the following tagged posts exist
      
      | username  | user_id     | content       | tag             | category                        | public    |
      | edasaur   | 2           | "comments"    | Observaion      | Zero Hunger                     | true      |
      | dodobird  | 1           | "comments2"   | Challenge       | Quality Education               | true      |
      | dodobird  | 1           | "comments3"   | Challenge       | Quality Education               | true      |
  
    And   I sign up as "dodo" with "dodosrule", email "dodo@dodo.com", and name "Dodo"
    And   I look at the tagged posts
  
  Scenario: Click on one of the 17 Sustainable Development Goals and see only posts relating to it
    When  I follow image link "Zero Hunger"
    Then  I should see "comments"
    And   I should not see "comments2"
    And   I should not see "comments3"
    
  Scenario: Can make a post relating to one of the Sustainable Development Goals
    When  I fill in "content_area" with "comments4"
    And   I select "Clean Water And Sanitation" from "Sustainable UN Goal"
    And   I select "Innovation" from "Category"
    And   I press "Submit"
    Then  I look at the tagged posts
    When  I follow image link "Clean Water And Sanitation"
    Then  I should see "comments4"
    And   I should not see "comments2"