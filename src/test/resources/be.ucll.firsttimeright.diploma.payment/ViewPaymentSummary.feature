Feature: View payment summary

  As a user
  I can ask for my payment summary
  in order to see the details of my payment and to choose the payment method

  Scenario Outline: The payment summary of an order is given with the payment options to choose from
    Given the order with number <ordernumber> and amount <amount>
    When I choose to pay for the order
    Then a payment summary is given with as merchant <merchant>, description <description>, reference <reference> and amount <amount>
    And the following payment options are given:
      | payment             |
      | Visa / MasterCard   |
      | Bancontact          |

    Examples:
      | ordernumber | amount  | merchant  | description      | reference        |
      | 1           | 15.00   | UCLL      | Order number 1   | '000/0000/00101' |
      | 99          | 30.00   | UCLL      | Order number 99  | '000/0000/09902' |

  Scenario: Cannot generate payment summary for an order that does not exist
    Given no orders
    When I choose to pay for the order with number 999
    Then an error message is given
    And the order is not created