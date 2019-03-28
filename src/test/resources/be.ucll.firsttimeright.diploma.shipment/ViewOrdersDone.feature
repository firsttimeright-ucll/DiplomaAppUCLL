Feature: Overview orders done

  As a user
  I can get an overview of all orders done
  In order to know which orders has been printed and sent

  Scenario: All orders with status done are given
    Given the following orders done:
      | name            | date        |
      | Greetje Jongen  | 29-12-2018  |
    When I ask the list of orders with status done
    Then the name and date of the orders done are given:
      | name            | date        |
      | Greetje Jongen  | 29-12-2018  |
    And the option to ask the details of each order to do is given

  Scenario: Message is given when there are no orders with status done
    Given no orders done
    When I ask the list of orders with status done
    Then a message "No orders done yet"