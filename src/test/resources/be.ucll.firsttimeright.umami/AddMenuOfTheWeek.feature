Feature: Add menu of the week
  As a planner
  I can create a menu for the week
  In order to be plan the week ahead

  Scenario: can have day-menus for monday till friday
    Given 5 different menus of the day
    When I register a menu of the week
    And I add each menu of the day to a different weekday
    Then the menu is registered

  Scenario Outline: can not have day-menus for saturday and sundays
    Given 1 menu of the day
    When I register a menu of the week
    And I add the menu of the day for "<day>"
    Then an error message is given
    And the menu is not registered

    Examples:
      | day      |
      | Saturday |
      | Sunday   |

  Scenario: can not have more than 1 day-menu on the same day
    Given 2 different menus of the day
    When I register a menu of the week
    And I add both menus of the day for "Friday"
    Then an error message is given
    And the menu is not registered

  Scenario: all days must fall in the same week
    Given 2 different menus of the day
    When I register a menu of the week
    And I add a menu of the day for coming "Friday"
    And I add a menu for the "Monday" after
    Then an error message is given
    And the menu is not registered

  Scenario: should have at least 1 day-menu
    When I register a menu of the week
    And I add np menu of the day
    Then an error message is given
    And the menu is not registered

  Scenario: does not need to have 5 day-menus
    Given 2 different menus of the day
    When I register a menu of the week
    And I add one menu of the day for coming "Monday"
    And I add the other menu of the day for the "Wednesday" after
    Then the menu is registered

  Scenario: cannot contain the same day-menu twice
    Given 1 menu of the day
    When I register a menu of the week
    And I add the menu of the day for coming "Monday"
    And I add the menu of the day for the "Friday" after
    Then an error message is given
    And the menu is not registered

  Scenario: can contain the same dish twice
    Given 2 menus of the day with "Fish and Chips"
    When I register a menu of the week
    And I add one menu of the day for coming "Monday"
    And I add the other menu of the day for the "Wednesday" after
    Then the menu is registered

  Scenario: cannot contain the same dish more than twice
    Given 3 menus of the day with "Fish and Chips"
    When I register a menu of the week
    And I add one menu of the day for coming "Monday"
    And I add another menu of the day for the "Wednesday" after
    And I add the third menu of the day for the "Friday" after
    Then an error message is given
    And the menu is not registered

  Scenario: the start date of the menu is the earliest day with a menu
    Given a menu of the week
    And the menu has a menu of the day for coming "Tuesday"
    And the menu has a menu of the day for the "Thursday" after
    When I ask for the start date of the week
    Then the "Tuesday" is returned

  Scenario: the end date of the menu is the latest day with a menu
    Given a menu of the week
    And the menu has a menu of the day for coming "Tuesday"
    And the menu has a menu of the day for the "Thursday" after
    When I ask for the end date of the week
    Then the "Thursday" is returned
