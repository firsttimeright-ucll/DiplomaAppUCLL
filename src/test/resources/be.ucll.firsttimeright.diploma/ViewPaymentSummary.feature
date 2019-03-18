Feature: View payment summary

  As a user
  I can ask for my payment summary
  in order to see the details of my payment and to choose the payment method

  Scenario: the payment details of a payment are given
    Given the order of a duplicate for <education> in the academic year <year> at campus <city>
    And the total cost of <price> euros
    When I choose to pay for the order
    Then a payment summary is given with the following data: the merchant <merchant>, the description <desciption>, the reference <reference> and the amount <amount>
    And the payment options are given: Visa/Mastercard, Bancontact or iDeal