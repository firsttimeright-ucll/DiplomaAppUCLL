Feature: View overview payed order

  As a user
  I can get an overview of my order
  in order to dubble check it or to print it

  Scenario Outline: When 1 duplicate ordered, the details of the payed order
    Given the order of a duplicate for <education> in the academic year <year> at campus <campus>
    And the total cost of <price> euro
    When I payed for it and ask for the details of the payed order
    Then the details of the duplicate are given: <education>, <year> and <campus>
    And the total cost is given: <price> euro
    And the payment method is given "Payed with <paymentmethod>"

    Examples:
      | education     | year      | campus  | price | paymentmethod   |
      | PB Chemistry  | 2017-2018 | Leuven  | 15.00 | Bancontact app  |

  Scenario Outline: When two different duplicates ordered, the details of the order are shown
    Given the order of a first duplicate for <education1> in the academic year <year1> at campus <campus1>
    Given the order of a second duplicate for <education2> in the academic year <year2> at campus <campus2>
    And the total cost of <price> euro
    When I payed for it and ask for the details of the payed order
    Then the details of the first duplicate are given: <education1>, <year1> and <campus1>
    Then the details of the second duplicate are given: <education2>, <year2> and <campus2>
    And the total cost is given: <price> euro
    And the payment method is given "Payed with <paymentmethod>"

    Examples:
      | education1    | year1     | campus1 | education2    | year2     | campus2 | price  | paymentmethod    |
      | PB TI         | 2011-2012 | Leuven  | PB Chemistry  | 2016-2017 | Limburg | 30.00  | Bancontact card  |
      | PB TI         | 1999-2000 | Leuven  | PB TI         | 1999-2000 | Limburg | 30.00  | Visa             |
