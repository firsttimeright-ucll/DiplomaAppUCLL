Feature: Details of order done

  As a user
  I can ask for the details of an order with status done
  In order to check the details of this order when needed

  Scenario: Details of an order with status done
    Given an order done for:
      | name            | date       |
      | Greetje Jongen  | 29-12-2018 |
    When I ask for the details of this order
    Then the following details are given:
      | date        | full name       | address                           | birth date  | diploma                   | payed | printed |
      | 29-12-2018  | Greetje Jongen  | Mechelsesteenweg 99 - 3000 Leuven | 10/10/1975  | PB TI, 2003-20014, Leuven | OK    | OK      |

