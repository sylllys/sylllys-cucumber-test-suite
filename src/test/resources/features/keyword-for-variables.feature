@regression @keyword-for-variables
Feature: Verify keyword to access variables

  Scenario: Verify keyword sysprop
    * assert {sysprop:testVar} and testVal are the same

  Scenario: Verify keyword env
    * assert {env:message} and Hi, this is from env file:dummy.properties are the same

  Scenario: Verify keyword dict
    * assert {global:message} and Hi, this is from global.properties file are the same

  Scenario: Verify keyword global
    Given {global:variable1} as Hello from Global Variables!!
    Then assert {global:variable1} and Hello from Global Variables!! are the same

  Scenario: Verify nested keyword global
    Given {global:variable1} as Hello from nested Global Variables!!
    Given {global:variable2} as {global:variable1}
    Then assert {global:variable2} and Hello from nested Global Variables!! are the same

  Scenario: Verify keyword file
    Given {global:name} as Tester
    Given {global:when} as yesterday
    Then assert {file:zippopotam/payloads/filename.txt} and Hello Tester!!, where were you yesterday? are the same

  Scenario: Verify nested keywords
    Given {global:nested-message} as Hello from nested keyswords!!
    Then assert {file:zippopotam/payloads/nested-message.txt} and Hello from nested keyswords!! are the same