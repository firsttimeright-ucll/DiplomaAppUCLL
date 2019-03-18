Feature: View overview order to pay

  As a user
  I can get an overview of my order
  in order to check it and pay for it

  Scenario: the details of the order are shown
    Given the order of a duplicate for <education> in the academic year <year> at campus <city>
    And the total cost of <price> euros
    When I ask the detail of the order
    Then the details of the duplicate(s) are given
    And the total cost is given

  Scenario: if no duplicates are ordered, a message is given
    Given no requested duplicate(s)
    When I ask the details of the order
    Then the message "You haven't ordered anything" is given