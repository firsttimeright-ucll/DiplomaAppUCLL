Feature: View payment summary

  As a user
  I can ask for my payment summary
  in order to see the details of my payment and to choose the payment method

  Scenario: The payment summary of an order is given with the payment options to choose from
    Given the order with the following details:
      | description        | amount  |
      | Order number 999   | 15.00   |
      | Order number 1001  | 30.00   |
    When I choose to pay for the order
    Then a payment summary is given with the following details:
      | merchant  | description        | reference       | amount  |
      | UCLL      | Order number 999   | 123/1223/12233  | 15.00   |
      | UCLL      | Order number 1000  | 123/1223/12234  | 30.00   |
    And the following payment options are given:
      | payment         |
      | Visa/Mastercard |
      | Bancontact      |