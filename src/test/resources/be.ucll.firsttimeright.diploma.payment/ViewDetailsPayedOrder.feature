Feature: View details payed order

  As a user
  I can get an overview of my order
  in order to dubble check it or to print it

  Scenario: When 1 duplicate ordered, the details of the payed order
    Given the order of 1 duplicate with the following details:
      | education     | year      | campus  |
      | PB Chemistry  | 2017-2018 | Leuven  |
    And the total cost of 15.00 euro
    And I payed for it with "Bancontact"
    When I ask for the details of the order
    Then the details of the duplicate are given:
      | education     | year      | campus  |
      | PB Chemistry  | 2017-2018 | Leuven  |
    And the total cost is given: 15.00 euro
    And the payment method is given: "Payed with Bancontact"

  Scenario: When two different duplicates ordered, the details of the order are shown
    Given the order of two duplicates with the following details:
      | education     | year      | campus  |
      | PB TI         | 2011-2012 | Leuven  |
      | PB Chemistry  | 2016-2017 | Limburg |
    And the total cost of 30.00 euro
    And I payed for it with "Bancontact"
    When I ask for the details of payed order
    Then the details of the two duplicate are given:
      | education     | year      | campus  |
      | PB TI         | 2011-2012 | Leuven  |
      | PB Chemistry  | 2016-2017 | Limburg |
    And the total cost is given: 30.00 euro
    And the payment method is given: "Payed with Bancontact card"