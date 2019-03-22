Feature: Details of order done

  As a user
  I can ask for the details of an order with status done
  In order to check the details of this order when needed

  Scenario: Details of an order with status done
    Given a done order for "Greetje Jongen" on "29-12-2018"
    When I ask for the details of this order
    Then the date is "29-12-2019"
    And the full name is "Greetje Jongen"
    And the address is "Mechelsesteenweg 99 - 3000 Leuven"
    And the birthdate is "10/10/1975"
    And the diploma is "PB TI, 2003-20014, Leuven"
    And the status payed is OK
    And the status printed and sent is OK

