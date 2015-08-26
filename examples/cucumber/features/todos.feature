Feature: Todos
  When a user visits "/todos", they should see all todos

  Scenario: User views todos
    Given 4 todos
    When I visit "/todos"
    Then I should see "Todo List"
    And I see 4 todos

