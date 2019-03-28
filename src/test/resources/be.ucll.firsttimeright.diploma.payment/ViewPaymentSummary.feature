Feature: View payment summary

  As a user
  I can ask for my payment summary
  in order to see the details of my payment and to choose the payment method

  Scenario: the payment details of a payment for 1 duplicate are given
    Given the order of a duplicate with the following details:
      | education     | year      | campus  |
      | PB Chemistry  | 2017-2018 | Leuven  |
    And the total cost of 15.00 euro
    When I choose to pay for the order
    Then a payment summary is given with the following data:
      | merchant  | description               | reference       | amount  |
      | UCLL      | Duplicates Elke Steegmans  | 123/1223/12233  | 15.00   |
    And the following payment options are given:
      | payment         |
      | Visa/Mastercard |
      | Bancontact      |

  Scenario: the payment details of a payment for 2 duplicates are given
    Given an order for the following duplicates:
      | education     | year      | campus  |
      | PB TI         | 2011-2012 | Leuven  |
      | PB Chemistry  | 2016-2017 | Limburg |
    And the total cost of 30.00 euro
    When I choose to pay for the order
    Then a payment summary is given with the following data:
      | merchant  | description             | reference       | amount  |
      | UCLL      | Duplicates Mieke Kemme  | 123/1223/12234  | 30.00   |
    And the following payment options are given:
      | payment         |
      | Visa/Mastercard |
      | Bancontact      |