@regression @in-built-steps
Feature: Verify in-built steps


  Scenario: Verify in-built steps
#    below step is used to set a global veriable
    Given {global:message} as Test Message to report!
#    below step holds execution for 3 seconds
    * wait for 3 seconds
#    below step logs the message to your report
    * print {global:message}