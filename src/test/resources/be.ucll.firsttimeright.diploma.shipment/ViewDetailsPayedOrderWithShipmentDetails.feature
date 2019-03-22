Feature: View details payed order

  As a user
  I can get an overview of my order
  in order to dubble check it or to print it

  Scenario Outline: When 1 duplicate ordered, the details of the payed order
    Given the order of a duplicate for <education> in the academic year <year> at campus <campus>
    And to be sent to the address: <name>, <street>, <city>, <country>
    And the total cost of <price> euro
    When I payed for it and ask for the details of the payed order
    Then the details of the duplicate are given: <education>, <year> and <campus>
    And the shipment details are given: <name>, <street>, <city>, <country>
    And the total cost is given: <price> euro
    And the payment method is given "Payed with <paymentmethod>"

    Examples:
      | education     | year      | campus  | name            | street            | city      | country | price | paymentmethod |
      | PB Chemistry  | 2017-2018 | Leuven  | Elke Steegmans  | Lintsesteenweg 81 | 2540 Hove | Belgium | 15.00 | Bancontact    |

  Scenario Outline: When two different duplicates ordered, the details of the order are shown
    Given the order of a first duplicate for <education1> in the academic year <year1> at campus <campus1>
    And the order of a second duplicate for <education2> in the academic year <year2> at campus <campus2>
    And to be sent to the address: <name>, <street>, <city>, <country>
    And the total cost of <price> euro
    When I payed for it and ask for the details of the payed order
    Then the details of the first duplicate are given: <education1>, <year1> and <campus1>
    And the details of the second duplicate are given: <education2>, <year2> and <campus2>
    And the shipment details are given: <name>, <street>, <city>, <country>
    And the total cost is given: <price> euro
    And the payment method is given "Payed with <paymentmethod>"

    Examples:
      | education1    | year1     | campus1 | education2    | year2     | campus2 | name          | street          | city          | country | price  | paymentmethod  |
      | PB TI         | 2011-2012 | Leuven  | PB Chemistry  | 2016-2017 | Limburg | Mieke Kemme   | Parkstraat 99   | 3000 Leuven   | Belgium | 30.00  | Bancontact     |
      | PB TI         | 1999-2000 | Leuven  | PB TI         | 1999-2000 | Limburg | Rudi Swennen  | Bulderkensweg 1 | 3520 Zonhoven | Belgium | 30.00  | Visa           |
