Feature: Overview orders done

  As a user
  I can get an overview of all orders done
  In order to know which orders has been printed and sent

  Scenario Outline: All orders with status done are given
    Given an order to do for <name> on date <date>
    When I ask the list of orders with status to do
    Then the 3 orders to do are given with an option to ask the details of each order

    Examples:
      | name            | date        |
      | Greetje Jongen  | 29-12-2018  |

  Scenario: Message is given when there are no orders with status done
    Given no orders to do
    When I ask the list of orders with status to do
    Then a message "No orders done"