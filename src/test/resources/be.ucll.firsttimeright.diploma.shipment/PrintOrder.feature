Feature: Print order

  As a user
  I can print and send the duplicate(s) of an order
  In order to change the status of this order to done

  Scenario: Change order status to done when printed and sent
    Given the order of "Elke Steegmans" on "01-03-2019"
    And the status is to do
    When I have printed and sent the duplicate of this order
    And I change the status to done
    Then this order is added to the list of orders with status done