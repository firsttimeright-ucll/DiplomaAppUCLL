Feature: Pay order

  As a user
  I can pay for my order
  in order to cover the cost to send it to me

  Scenario: pay the order choosing for bancontact
    Given a payment summary with the following data: the merchant <merchant>, the description <desciption>, the reference <reference> and the amount <amount>
    When I choose to pay with bancontact
    Then the option between pay with your Bancontact app or Bancontact card is given

  Scenario: pay the order choosing for Visa/Mastercard
    Given a payment summary with the following data: the merchant <merchant>, the description <desciption>, the reference <reference> and the amount <amount>
    When I choose to pay with Visa/Mastercard
