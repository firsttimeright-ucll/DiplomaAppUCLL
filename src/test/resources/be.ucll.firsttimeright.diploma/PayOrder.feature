Feature: Pay order

  As a user
  I can pay for my order
  in order to cover the cost to send it to me

  Scenario Outline: pay the order choosing for bancontact app
    Given a payment summary with the following data: the merchant <merchant>, the description <description>, the reference <reference> and the amount <amount>
    When I choose to pay with bancontact
    Then the option between pay with your Bancontact app or Bancontact card is given
    When I choose the option to pay with the app
    And I scan the QR-code with my phone
    Then the order is payed

    Examples:
      | merchant  | description             | reference       | amount  |
      | UCLL      | Duplicates Mieke Kemme  | 123/1223/12233  | 15.00   |

  Scenario Outline: pay the order choosing for bancontact card
    Given a payment summary with the following data: the merchant <merchant>, the description <description>, the reference <reference> and the amount <amount>
    When I choose to pay with bancontact
    Then the option between pay with your Bancontact app or Bancontact card is given
    When I choose the option to pay with my card
    And I give the cardholder name <name>, the card number <cardnumber> and the expiry date <month>/<year>
    Then the order is payed

    Examples:
      | merchant  | description               | reference       | amount  | name            | cardnumber            | month | year  |
      | UCLL      | Duplicates Elke Steegmans | 123/1223/12234  | 30.00   | Elke Steegmans  | 6703 0000 0000 0000 3 | 09    | 2021  |

  Scenario Outline: pay the order choosing for Visa/Mastercard
    Given a payment summary with the following data: the merchant <merchant>, the description <description>, the reference <reference> and the amount <amount>
    When I choose to pay with Visa/Mastercard
    And I give the cardholder name <name>, the card number <cardnumber>, the expiration date <month>/<year> and the card security code <securitycode>
    Then the order is payed

    Examples:
      | merchant  | description               | reference       | amount  | name            | cardnumber                | month | year  | securitycode |
      | UCLL      | Duplicates Rudi Swennen   | 123/1223/12235  | 30.00   | Rudi Swennen    | 4111 1111 1111 1111 1111  | 01    | 2022  | 123          |

