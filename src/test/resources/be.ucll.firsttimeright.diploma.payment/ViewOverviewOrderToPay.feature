Feature: View overview order to pay

  As a user
  I can get an overview of my order
  in order to check it and pay for it

  Scenario Outline: When 1 duplicate ordered, the details of the order are shown
    Given the order of a duplicate for <education> in the academic year <year> at campus <campus>
    And the total cost of <price> euro
    When I ask the detail of the order
    Then the details of the duplicate are given
    And the total cost is given

    Examples:
      | education     | year      | campus  | price |
      | PB Chemistry  | 2017-2018 | Leuven  | 15.00 |

  Scenario Outline: When two different duplicates ordered, the details of the order are shown
    Given the order of a first duplicate for <education1> in the academic year <year1> at campus <campus1>
    Given the order of a second duplicate for <education2> in the academic year <year2> at campus <campus2>
    And the total cost of <price> euro
    When I ask the detail of the order
    Then the details of the duplicate(s) are given
    And the total cost is given

    Examples:
      | education1    | year1     | campus1 | education2    | year2     | campus2 | price  |
      | PB TI         | 2011-2012 | Leuven  | PB Chemistry  | 2016-2017 | Limburg | 30.00  |
      | PB TI         | 1999-2000 | Leuven  | PB TI         | 1999-2000 | Limburg | 30.00  |

  Scenario: if no duplicates are ordered, a message is given
    Given no requested duplicate(s)
    When I ask the details of the order
    Then the message "No duplicates ordered" is given