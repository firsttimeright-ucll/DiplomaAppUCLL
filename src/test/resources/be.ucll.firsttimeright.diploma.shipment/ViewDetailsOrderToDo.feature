Feature: Details of order to do

  As a user
  I can ask for the details of an order with status to do
  In order to print and to send this duplicate(s)

  Scenario: Details of an order with one duplicate to print and to send
    Given a payed order for:
      | name            | date       |
      | Elke Steegmans  | 01-03-2019 |
    And the status of this order is to do
    When I ask for the details of this order
    Then the following details are given:
      | date        | full name       | address                                 | birth date  | diploma                   | payed |
      | 29-12-2018  | Elke Steegmans  | Lintsesteenweg 81 - 2540 Hove - Belgium | 28/01/1978  | PB TI, 2017-2018, Leuven  | OK    |

  Scenario: Details of an order with two different duplicates to print and to send
    Given a payed order for:
      | name         | date       |
      | Mieke Kemme  | 28-02-2019 |
    And the status of this order is to do
    When I ask for the details of this order
    Then the following details are given:
      | date        | full name       | address                                 | birth date  | diploma 1                 | diploma2                         | payed |
      | 29-12-2018  | Elke Steegmans  | Lintsesteenweg 81 - 2540 Hove - Belgium | 28/01/1978  | PB TI, 2017-2018, Leuven  | PB Chemistry, 2016-2017, Limburg | OK    |
