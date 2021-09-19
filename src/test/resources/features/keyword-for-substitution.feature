@regression @keyword-for-substitution
Feature: Verify substitution keywords


  Scenario: Verify keyword to generate line seperators
    * assert {NEW_LINE} and \r\n|\n|\r does match
    * assert {LINE_FEED} and \n does match
    * assert {CARRIAGE_RETURN} and \r does match

  Scenario: Verify keyword for null substitution
    * assert {NULL} and {null} are the same
    * assert {Null} and {null} are the same
    * assert {nUll} and {null} are the same
    * assert {NuLl} and {null} are the same


  Scenario: Verify keyword for SPACE substitution
    * assert AB{SPACE}CD and AB CD are the same
    * assert {SPACE}ABCD and  ABCD are the same
    * assert ABCD{SPACE} and ABCD  are the same
    * assert AB{SPACE_3}CD and AB   CD are the same
    * assert AB{SPACE_03}CD and AB   CD are the same

  Scenario: Verify keyword for EMPTY substitution
    * assert AB{EMPTY}CD and ABCD are the same

  Scenario: Verify file path substitution
    * assert {.} and {..}(\\|/).* does match