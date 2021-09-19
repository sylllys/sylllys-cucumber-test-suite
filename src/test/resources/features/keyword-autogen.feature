@regression @keyword-autogen
Feature: Verify autogen keyword


  Scenario: Verify generation of numbers
    * assert {autogen:number_5} and [0-9]{5} does match
    * assert {autogen:number_5:9} and [5-9] does match

  Scenario: Verify conversion of case of alphabets
    * assert {autogen:abc->uppercase} and ABC are the same
    * assert {autogen:ABC->lowercase} and abc are the same

  Scenario: Verify generation of text
    * assert {autogen:text_5} and [a-z]{5} does match

  Scenario: Verify encryption for base64 format
    * assert {autogen:sample->encrypt-base64} and c2FtcGxl are the same

  Scenario: Verify dencryption for base64 format
    * assert {autogen:c2FtcGxl->decrypt-base64} and sample are the same

  Scenario: Verify keyword ENCRYPT for sha512Hex format
    * assert {autogen:sample->uppercase->encrypt-sha512hex} and {autogen:SAMPLE->encrypt-sha512hex} are the same

  Scenario: Verify generation of timestamp
    * assert {autogen:timestamp_zone:IST_format:dd-MM-yy_edit:+MONTH:12} and {autogen:timestamp_zone:IST_format:dd-MM-yy_edit:+YEAR:1} does match
    * print {autogen:timestamp_zone:IST_format:dd-MM-yy_edit:+MONTH:12}
    * assert {autogen:timestamp_format:IN-MILLISECONDS} and \d+ does match
    * assert {autogen:timestamp_format:IN-SECONDS} and \d+ does match