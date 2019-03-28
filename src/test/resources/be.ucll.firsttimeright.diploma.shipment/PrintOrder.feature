Feature: Print order

  As a user
  I can print and send the duplicate(s) of an order
  In order to change the status of this order to done

  Scenario: Change order status to done when printed and sent
    Given the following order:
      | name            | date        |
      | Elke Steegmans  | 01-03-2019  |
    And the status of this order is to do
    When I have printed and sent the duplicate(s) of this order
    And I change the status of this order to done
    Then this order is added to the list of orders with status done