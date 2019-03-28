Feature: View details order to pay

  As a user
  I can get an overview of my order
  in order to check it and pay for it

  Scenario: When 1 duplicate ordered, the details of the order are shown
    Given the order of a duplicate for PB Chemistry in the academic year 2017-2018 at campus Leuven
    And to be sent to the address: Elke Steegmans, Lintsesteenweg 81, 2540 Hove, Belgium
    And the total cost of 15.00 euro
    When I ask the detail of the order
    Then the details of the duplicate are given
    And the shipment details are given
    And the total cost is given

  Scenario: When two different duplicates ordered, the details of the order are shown
    Given an order for the following duplicates:
      | education     | year      | campus  |
      | PB TI         | 2011-2012 | Leuven  |
      | PB Chemistry  | 2016-2017 | Limburg |
    And to be sent to the address:
      | name        | street        | city        | country   |
      | Mieke Kemme | Parkstraat 99 | 3000 Leuven | Belgium   |
    And the total cost of 30.00 euro
    When I ask the details of the order
    Then the details of the ordered duplicates are:
      | education     | year      | campus  |
      | PB TI         | 2011-2012 | Leuven  |
      | PB Chemistry  | 2016-2017 | Limburg |
    And the shipment details are:
      | name        | street        | city        | country   |
      | Mieke Kemme | Parkstraat 99 | 3000 Leuven | Belgium   |
    And the total cost of 30.00 is given

  Scenario: When two duplicates of the same diploma are ordered, the details of the order are shown
    Given an order for the following duplicates:
      | education     | year      | campus  |
      | PB TI         | 1999-2000 | Leuven  |
      | PB TI         | 1999-2000 | Leuven  |
    And to be sent to the address:
      | name         | street          | city          | country   |
      | Rudi Swennen | Bulderkensweg 1 | 3520 Zonhoven | Belgium   |
    And the total cost of 30.00 euro
    When I ask the details of the order
    Then the details of the ordered duplicates are:
      | education     | year      | campus  |
      | PB TI         | 1999-2000 | Leuven  |
      | PB TI         | 1999-2000 | Leuven  |
    And the shipment details are:
      | name         | street          | city          | country   |
      | Rudi Swennen | Bulderkensweg 1 | 3520 Zonhoven | Belgium   |
    And the total cost of 30.00 is given