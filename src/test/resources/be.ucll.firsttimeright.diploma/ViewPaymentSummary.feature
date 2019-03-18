Feature: View payment summary

  As a user
  I can ask for my payment summary
  in order to see the details of my payment and to choose the payment method

  Scenario Outline: the payment details of a payment for 1 duplicate are given
    Given the order of a duplicate for <education> in the academic year <year> at campus <campus>
    And the total cost of <price> euro
    When I choose to pay for the order
    Then a payment summary is given with the following data: the merchant <merchant>, the description <description>, the reference <reference> and the amount <amount>
    And the payment options are given: Visa/Mastercard, Bancontact or iDeal

    Examples:
    | education     | year      | campus  | price | merchant  | description             | reference       | amount  |
    | PB Chemistry  | 2017-2018 | Leuven  | 15.00 | UCLL      | Duplicates Mieke Kemme  | 123/1223/12233  | 15.00   |

  Scenario Outline: the payment details of a payment for 2 duplicates are given
    Given the order of a first duplicate for <education1> in the academic year <year1> at campus <campus1>
    And the order of a second duplicate for <education2> in the academic year <year2> at campus <campus2>
    And the total cost of <price> euro
    When I choose to pay for the order
    Then a payment summary is given with the following data: the merchant <merchant>, the description <description>, the reference <reference> and the amount <amount>
    And the payment options are given: Visa/Mastercard, Bancontact or iDeal

    Examples:
      | education1  | year1     | campus1 | education2    | year2     | campus2 | price | merchant  | description               | reference       | amount  |
      | PB TI       | 2011-2012 | Leuven  | PB Chemistry  | 2016-2017 | Limburg | 30.00 | UCLL      | Duplicates Elke Steegmans | 123/1223/12234  | 30.00   |
      | PB TI       | 1999-2000 | Leuven  | PB TI         | 1999-2000 | Leuven  | 30.00 | UCLL      | Duplicates Rudi Swennen   | 123/1223/12235  | 30.00   |
