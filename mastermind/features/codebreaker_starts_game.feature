Feature: code-breaker starts game
  As a code-breaker
  I want to start a game
  So that I can break the code

  Scenario: start game
    When I start a new game
    Then I should see the message "Welcome to Mastermind!"
    And I should see the message "Enter guess:"
