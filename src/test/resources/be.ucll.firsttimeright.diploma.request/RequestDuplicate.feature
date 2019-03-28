Feature: Request duplicate for diploma

  As a user
  I can request one or more duplicates of diploma's
  In order to get them sent to me

  Scenario:
    Given a user "Elke Steegmans"
    And a request for a duplicate in the academic year "2017-2018"
    And for the education "PB TI"
    And for the campus "Leuven"
    When I request for the duplicate
    Then a new order for this request is made

  Scenario:
    Given a user "Elke Steegmans"
    And a request for a duplicate in the academic year "2020-2021"
    And for the education "PB TI"
    And for the campus "Leuven"
    When I request for the duplicate
    Then a message "" is given

  Scenario:
    Given no user
    And a request for a duplicate in the academic year "2017-2018"
    And for the education "PB TI"
    And for the campus "Leuven"
    When I request for the duplicate
    Then the message "You need to sign up or log in first" is given