Feature: New menu of the week
  As a planner
  I can create a menu for the week
  In order to be plan the week ahead

  Scenario: can have day-menus for monday till friday
    Given I have following menus of the day:
      | nr | soup           | dishOfTheDay              | veggie                    |
      | 1  | Tomato soup    | Pasta Carbonara           | Fish and chips            |
      | 2  | Ministrone     | Vol au vent               | Chili sin carne           |
      | 3  | Brocolli soup  | Leaks and Ham             | Veggie lasagna            |
      | 4  | Carrot soup    | Steak and chips           | Falafel in Tomato sauce   |
      | 5  | Asparagus soup | MeatBalls in Tomato sauce | Mushroom burger and chips |
    When I want to create a menu of the week
    And I use each menu of the day for a different weekday:
      | menu | day       |
      | 1    | Monday    |
      | 2    | Tuesday   |
      | 3    | Wednesday |
      | 4    | Thursday  |
      | 5    | Friday    |
    Then the menu of the week is registered with the given menus of the day:
      | day       | soup           | dishOfTheDay              | veggie                    |
      | Monday    | Tomato soup    | Pasta Carbonara           | Fish and chips            |
      | Tuesday   | Ministrone     | Vol au vent               | Chili sin carne           |
      | Wednesday | Brocolli soup  | Leaks and Ham             | Veggie lasagna            |
      | Thursday  | Carrot soup    | Steak and chips           | Falafel in Tomato sauce   |
      | Friday    | Asparagus soup | MeatBalls in Tomato sauce | Mushroom burger and chips |


  Scenario: does not need to have 5 day-menus
    Given I have following menus of the day:
      | nr | soup        | dishOfTheDay    | veggie          |
      | 1  | Tomato soup | Pasta Carbonara | Fish and chips  |
      | 2  | Ministrone  | Vol au vent     | Chili sin carne |
    When I want to create a menu of the week
    And I use each menu of the day for a different weekday:
      | menu | day       |
      | 1    | Monday    |
      | 2    | Wednesday |
    And I add no menus for the rest of the weekdays:
      | menu | day      |
      |      | Tuesday  |
      |      | Thursday |
      |      | Friday   |
    Then the menu of the week is registered with the given menus of the day:
      | day       | soup        | dishOfTheDay    | veggie          |
      | Monday    | Tomato soup | Pasta Carbonara | Fish and chips  |
      | Wednesday | Ministrone  | Vol au vent     | Chili sin carne |


  Scenario: should have at least 1 day-menu
    When I want to create a menu of the week
    And I have no menus of the day:
      | menu | day       |
      |      | Monday    |
      |      | Tuesday   |
      |      | Wednesday |
      |      | Thursday  |
      |      | Friday    |
    Then an error message is given
    And the menu is not registered


  Scenario Outline: can not have day-menus for saturday and sundays
    Given I have some menu of the day
    When I want to create a menu of the week
    And I use this menu of the day for "<day>"
    Then an error message is given
    And the menu is not registered

    Examples:
      | day      |
      | Saturday |
      | Sunday   |


  Scenario: can not have more than 1 day-menu on the same day
    Given I have following menus of the day:
      | nr | soup           | dishOfTheDay              | veggie                    |
      | 1  | Tomato soup    | Pasta Carbonara           | Fish and chips            |
      | 2  | Ministrone     | Vol au vent               | Chili sin carne           |
    When I want to create a menu of the week
    And I use both menus of the day for Friday:
      | menu | day       |
      | 1    | Friday    |
      | 2    | Friday   |
    Then an error message is given
    And the menu is not registered


  Scenario: can only have days that fall in the same week
    Given I have following menus of the day:
      | nr | soup           | dishOfTheDay              | veggie                    |
      | 1  | Tomato soup    | Pasta Carbonara           | Fish and chips            |
      | 2  | Ministrone     | Vol au vent               | Chili sin carne           |
    When I want to create a menu of the week
    And I use the 1st menu of the day for coming "Friday"
    And I use the 2nd menu of the day for the "Monday" after
    Then an error message is given
    And the menu is not registered


  Scenario: cannot contain the same day-menu twice
    Given I have following menu of the day:
      | nr | soup           | dishOfTheDay              | veggie                    |
      | 1  | Tomato soup    | Pasta Carbonara           | Fish and chips            |
    When I want to create a menu of the week
    And I use this menus for 2 different weekdays:
      | menu | day       |
      | 1    | Monday    |
      | 1    | Tuesday   |
    Then an error message is given
    And the menu is not registered


  Scenario: can contain the same dish twice
    Given I have following menus of the day:
      | nr | soup           | dishOfTheDay              | veggie                    |
      | 1  | Tomato soup    | Pasta Carbonara           | Fish and chips            |
      | 2  | Ministrone     | Fish and chips            | Chili sin carne           |
    When I want to create a menu of the week
    And I use each menu of the day for a different weekday:
      | menu | day       |
      | 1    | Monday    |
      | 2    | Wednesday |
    Then the menu of the week is registered with the given menus of the day:
      | day       | soup        | dishOfTheDay    | veggie          |
      | Monday    | Tomato soup | Pasta Carbonara | Fish and chips  |
      | Wednesday | Ministrone  | Fish and chips   | Chili sin carne |


  Scenario: cannot contain the same dish more than twice
    Given I have following menus of the day:
      | nr | soup           | dishOfTheDay              | veggie                    |
      | 1  | Tomato soup    | Pasta Carbonara           | Fish and chips            |
      | 2  | Ministrone     | Fish and chips            | Chili sin carne           |
      | 3  | Brocolli soup  | Leaks and Ham             | Fish and chips            |
    When I want to create a menu of the week
    And I use each menu of the day for a different weekday:
      | menu | day       |
      | 1    | Monday    |
      | 2    | Wednesday |
      | 3    | Friday    |
    Then an error message is given
    And the menu is not registered


  Scenario: has as  start date the earliest day with a menu
    Given I have following menu of the week:
      | day      | soup        | dishOfTheDay    | veggie          |
      | Tuesday  | Tomato soup | Pasta Carbonara | Fish and chips  |
      | Thursday | Ministrone  | Fish and chip   | Chili sin carne |
    When I ask for the start date of the week
    Then "Tuesday" is returned


  Scenario: has as end date the latest day with a menu
    Given I have following menu of the week:
      | day      | soup        | dishOfTheDay    | veggie          |
      | Tuesday  | Tomato soup | Pasta Carbonara | Fish and chips  |
      | Thursday | Ministrone  | Fish and chips   | Chili sin carne |
    When I ask for the end date of the week
    Then "Thursday" is returned
