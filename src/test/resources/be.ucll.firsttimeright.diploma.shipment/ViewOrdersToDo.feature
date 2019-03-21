Feature: Overview orders to do

  As a user
  I can get an overview of all orders to do
  In order to know which payed orders I need to print and to send

  Scenario Outline: All orders with status to do are given
    Given an order to do for <name> on date <date>
    And an order to do for <name> on date <date>
    And an order to do for <name> on date <date>
    When I ask the list of orders with status to do
    Then the 3 orders to do are given with an option to ask the details of each order

    Examples:
    | name            | date        |
    | Elke Steegmans  | 01-03-2019  |
    | Mieke Kemme     | 28-02-2019  |
    | Rudi Swennen    | 29-01-2019  |

  Scenario: Message is given when there are no orders with status to do anymore
    Given no orders to do
    When I ask the list of orders with status to do
    Then a message "No orders anymore to do"