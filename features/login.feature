Feature: Sign up and login
  As a social media user
  In order to share my thoughts/contributions in a safe, positive environments and look at others' thoughts/contributions
  I want to be able to sign up and login to Visionaria
  
  Background: 
    Given I am on the home page
    And   the following users exist
    
      | username      | name            | password          | email             |
      | dodobird      | Joanna Ng       | dodosrule         | dodo@example.com  |
      | edasaur       | Ed Wang         | dinosaursarecool  | dino@example.com  |
    
  Scenario: Sign up to new account
    When  I follow "Sign up"
    And   I fill in "Username" with "cs169"
    And   I fill in "Name" with "Joanna Ng"
    And   I fill in "Email" with "jojo@example.com"
    And   I fill in "Password | Contraseña" with "123456"
    And   I fill in "Password Confirmation | Confirmación de contraseña" with "123456"
    And   I press "Sign up | Regístrate"
    Then  I should see "cs169"
    
  Scenario: Successfully sign in to existing account and going to homepage should redirect to posts
    When  I follow "Login"
    And   I fill in "Email" with "dodo@example.com"
    And   I fill in "Password" with "dodosrule"
    And   I press "Login"
    Then  I should see "dodobird"
    And   I should not see "edasaur"
    Given I am on the homepage
    Then  I look at the posts
    
  Scenario: Cannot sign in with incorrect password
    When  I follow "Login"
    And   I fill in "Email" with "dodo@example.com"
    And   I fill in "Password" with "dodo"
    And   I press "Login"
    Then  I should see "Invalid Email or password."
    And   I should not see "dodobird"
    
  Scenario: Cannot sign in to non-existant user
    When  I follow "Login"
    And   I fill in "Email" with "DodosAreTheBest"
    And   I fill in "Password" with "987657"
    And   I press "Login"
    Then  I should see "Invalid Email or password."
    