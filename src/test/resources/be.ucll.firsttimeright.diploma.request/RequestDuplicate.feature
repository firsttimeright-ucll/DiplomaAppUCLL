Feature: Request duplicate for diploma

  As a user
  I can request one or more duplicates of diploma's
  In order to get them sent to me

  Scenario:
    Given a user "Elke Steegmans"
    When I request for a duplicate in the academic year "2017-2018"
    And for the education "PB TI"
    And for the campus "Leuven"
    Then a new order for this request is made