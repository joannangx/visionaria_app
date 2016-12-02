Feature: Set language preferrences
    As a social media user
    In order to view information in my preferred language
    I want to be able to set my language preferrences
    
    Background:
        Given   I am on the home page
        And     the following users exist
        
          | username      | name            | password          | email             |
          | dodobird      | Joanna Ng       | dodosrule         | dodo@example.com  |
          | edasaur       | Ed Wang         | dinosaursarecool  | dino@example.com  |
        
        And     the following posts exist
          
          | username    | user_id   | content       | public    |
          | edasaur     | 2         | "comments"    | true      |
          | dodobird    | 1         | "comments2"   | true      |
      
        And     I sign up as "dodo" with "dodosrule", email "dodo@dodo.com", and name "Dodo"

    Scenario: Can change language to Spanish and back to English
        When    I follow "Español"
        Then    I should see "Bienvenido, dodo"
        When    I follow "English"
        Then    I should see "Welcome, dodo"