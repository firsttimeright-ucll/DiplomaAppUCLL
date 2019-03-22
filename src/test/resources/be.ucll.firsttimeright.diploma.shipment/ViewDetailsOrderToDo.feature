Feature: Details of order to do

  As a user
  I can ask for the details of an order with status to do
  In order to print and to send this duplicate(s)

  Scenario Outline: Details of an order with one duplicate to print and to send
    Given a payed order for <name> on <date>
    And the status is to do
    When I ask for the details of this order
    Then the date is <date>
    And the full name is <name>
    And the address is <address>
    And the birth date is <birthdate>
    And the diploma is <diploma>
    And the status payed is OK

    Examples:
    | name            | date        | address                                 | birthdate   | diploma                   |
    | Elke Steegmans  | 01-03-2019  | Lintsesteenweg 81 - 2540 Hove - Belgium | 28/01/1978  | PB TI, 2017-2018, Leuven  |

  Scenario Outline: Details of an order with two different duplicates to print and to send
    Given a payed order for <name> on <date>
    And the status is to do
    When I ask for the details of this order
    Then the date is <date>
    And the full name is <name>
    And the address is <address>
    And the birthdate is <birthdate>
    And the first diploma is <diploma1>
    And the second diploma is <diploma2>
    And the status payed is OK

    Examples:
      | name        | date        | address                     | birthdate   | diploma1                 | diploma2                         |
      | Mieke Kemme | 28-02-2019  | Parkstraat 99 - 3000 Leuven | 25/08/1967  | PB TI, 2011-2012, Leuven | PB Chemistry, 2016-2017, Limburg |