Feature: Show overview menus of the day
  As a planner
  I can request the overview of the menus of the day
  In order to know if I have all the menus I need

  Scenario Outline: all existing menus of the day are given
    Given <aNumber> different menus of the day
    When I ask for the list of menus of the day
    Then all <aNumber> menus are given

    Examples:
      | aNumber |
      | 1       |
      | 5       |
      | 100     |

  Scenario: all dishes of the menu are shown
    Given 4 menus of the day
    When I ask for the list of menus of the day
    Then the soup, dish of the day and veggie dish of each menu are given

  Scenario: if no menu of the day an empty list is given
    Given no menus of the day
    When I ask for the list of menus of the day
    Then an empty list is given