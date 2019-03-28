Feature: Overview orders to do

  As a user
  I can get an overview of all orders to do
  In order to know which payed orders I need to print and to send

  Scenario: All orders with status to do are given
    Given the following orders to do:
      | name            | date        |
      | Elke Steegmans  | 01-03-2019  |
      | Mieke Kemme     | 28-02-2019  |
      | Rudi Swennen    | 29-01-2019  |
    When I ask the list of orders with status to do
    Then the name and date of the orders to do are given:
      | name            | date        |
      | Elke Steegmans  | 01-03-2019  |
      | Mieke Kemme     | 28-02-2019  |
      | Rudi Swennen    | 29-01-2019  |
    And the option to ask the details of each order to do is given

  Scenario: Message is given when there are no orders with status to do anymore
    Given no orders to do
    When I ask the list of orders with status to do
    Then a message "No orders to do anymore"