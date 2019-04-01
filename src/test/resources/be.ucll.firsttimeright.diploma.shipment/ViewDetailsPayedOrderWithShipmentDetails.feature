Feature: View details payed order

  As a user
  I can get an overview of my order
  in order to check it

  Scenario: When an order for 1 duplicate is payed, the details of this payed order are given
    Given the order of 1 duplicate with the following details:
      | education     | year      | campus  |
      | PB Chemistry  | 2017-2018 | Leuven  |
    And to be sent to the address:
      | name           | street            | city      | country   |
      | Elke Steegmans | Lintsesteenweg 81 | 2540 Hove | Belgium   |
    And the total cost of 15.00 euro
    And I payed for it with "Bancontact"
    When I ask for the details of the order
    Then the details of the duplicate are given:
      | education     | year      | campus  |
      | PB Chemistry  | 2017-2018 | Leuven  |
    And the shipment details are:
      | name           | street            | city      | country   |
      | Elke Steegmans | Lintsesteenweg 81 | 2540 Hove | Belgium   |
    And the total cost is given: 15.00 euro
    And the payment method is given: "Payed with Bancontact"

  Scenario: When an order for 2 duplicates is payed, the details of this payed order are given
    Given the order of two duplicates with the following details:
      | education     | year      | campus  |
      | PB TI         | 2011-2012 | Leuven  |
      | PB Chemistry  | 2016-2017 | Limburg |
    And to be sent to the address:
      | name        | street        | city        | country   |
      | Mieke Kemme | Parkstraat 99 | 3000 Leuven | Belgium   |
    And the total cost of 30.00 euro
    And I payed for it with "Bancontact"
    When I ask for the details of payed order
    Then the details of the two duplicate are given:
      | education     | year      | campus  |
      | PB TI         | 2011-2012 | Leuven  |
      | PB Chemistry  | 2016-2017 | Limburg |
    And the shipment details are:
      | name        | street        | city        | country   |
      | Mieke Kemme | Parkstraat 99 | 3000 Leuven | Belgium   |
    And the total cost is given: 30.00 euro
    And the payment method is given: "Payed with Bancontact card"