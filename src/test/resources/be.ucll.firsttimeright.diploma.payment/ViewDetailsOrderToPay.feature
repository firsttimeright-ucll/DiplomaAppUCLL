Feature: View details order to pay

  As a user
  I can get an overview of my order
  in order to check it and pay for it

  Scenario: When 1 duplicate ordered, the details of the order are shown
    Given the order of a duplicate for "PB Chemistry" in the academic year "2017-2018" at campus "Leuven"
    And the total cost of 15.00 euro
    When I ask for the details of the order
    Then the education "PB Chemistry", the academic year "2017-2018" and the campus "Leuven" are given
    And the total cost of 15.00 euro is given

  Scenario: When 2 different duplicates ordered, the details of the order are shown
    Given an order for the following duplicates:
      | education     | year      | campus  |
      | PB TI         | 2011-2012 | Leuven  |
      | PB Chemistry  | 2016-2017 | Limburg |
    And the total cost of 30.00 euro
    When I ask the details of the order
    Then the details of the ordered duplicates are:
      | education     | year      | campus  |
      | PB TI         | 2011-2012 | Leuven  |
      | PB Chemistry  | 2016-2017 | Limburg |
    And the total cost of 30.00 is given

  Scenario: When 2 duplicates of the same diploma are ordered, the details of the order are shown
    Given an order for the following duplicates:
      | education     | year      | campus  |
      | PB TI         | 1999-2000 | Leuven  |
      | PB TI         | 1999-2000 | Leuven  |
    And the total cost of 30.00 euro
    When I ask the details of the order
    Then the details of the ordered duplicates are:
      | education     | year      | campus  |
      | PB TI         | 1999-2000 | Leuven  |
      | PB TI         | 1999-2000 | Leuven  |
    And the total cost of 30.00 is given