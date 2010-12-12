Feature: Manage Threads
  In order to to discuss separate threads of conversation
  As a user
  I want create and manage Threads

  Scenario: List existing Threads
    Given the following ForumThread exists:
      | title   |
      | Coke    |
      | London  |
    When I go to the list of threads
    Then I should see "Coke"
    And I should see "London"

  Scenario: Create new Thread
    Given I have no threads
    And I am logged on as "Jake"
    When I follow "New thread"
    And I fill in "Title" with "Coke"
    And I fill in "Content" with "Do you like coke?"
    And I press "Create Thread"
    Then I should be on the "Coke" thread page
    And I should see "Created new thread"
    And I should see "Coke"
    And I should see "Do you like coke?"
    And I should see "said Jake"