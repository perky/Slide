Feature: authenticate users
  In order to distinguish users and have personal settings
  As a user and admin
  I want authenticate users

  Scenario: Log in
    Given the following user exists:
      | username    |
      | bob         |
    When I login as "bob"
    Then I should see "Logout"
    And I should see "Welcome bob"
    And I should not see "Login"

  Scenario: Log out
    Given I am logged in
    When I follow "Logout"
    Then I should see "Login"
    And I should see "You have logged out"
    And I should not see "Logout"

  Scenario: Sign up
    Given I am logged out
    And no users exist
    When I go to the sign up page
    And I fill in "user_username" with "bob"
    And I fill in "user_email" with "bob@domain.com"
    And I fill in "user_password" with "foobar"
    And I fill in "user_password_confirmation" with "foobar"
    And I press "Sign up"
    Then I should see "You have signed up"
    And I should see "Welcome bob"
    And I should see "Logout"
    And I should not see "Sign up"

  Scenario: Log in with wrong credentials
    Given I am logged out
    When I follow "Login"
    And I fill in "login" with "randomguy"
    And I fill in "password" with "wrongpassword"
    And I press "Log in"
    Then I should see "Incorrect username and/or password"
    And I should be on the login page
