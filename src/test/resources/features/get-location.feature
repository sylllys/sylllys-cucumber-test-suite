@regression @rest-api-example @get-location-api
Feature: Get location API

  @smoke
  Scenario: verify location can be retrieved using country and post code
#   This is an built-in function to send API requests
#   'details' attribute is used to provide the endpoint configuration in yml file
#   you can also override the pre-defined config values in yml file by passing them in feature file
#   'header key:value' attribute is used to update a header value of the request from yml file with same key name
#   'param key:value' attribute is used to update a parameter value of the request from yml file with same key name
#   'body #json body' attribute is used to update a body of the request other than from yml file
#   'body.edit jsonPath:value' attribute is used to update a json tuple in the body from yml file
#   in the above settings if the targeted field does not exists, a new field will be added
    Given a request is sent to end point
      | details zippopotam/endPoints/get-location-using-country-postcode.yml |
#   use this to verify response code of the previous request
    Then verify response code is 200
#   we use json path lib for validation, visit:https://github.com/json-path/JsonPath, for more information
#   you can use this url:http://jsonpath.herokuapp.com to evaluate jayway json path
    Then verify response body is JSON with tuple(s)
#    different examples of how to validate a response
#    verify an array response
      | $.places[?(@.['place name']=='The Rocks')].state                  | has item New South Wales |
      | $.places[?(@.['place name']=='The Rocks')].['state abbreviation'] | has item NSW             |
      | $.places[?(@.['place name']=='The Rocks')].longitude              | has item 151.2082        |
      | $.places[?(@.['place name']=='The Rocks')].latitude               | has item -33.8666        |
      | $.places[*].['state abbreviation']                                | does not have item VIC   |
#    verify a text response, keywords used here are using String contains, matches, equals function
      | $.places[0].['state abbreviation']                                | NSW                      |
      | $.places[1].state                                                 | contains South           |
      | $.places[2].state                                                 | !contains Northern       |
      | $.places[3].state                                                 | regex New.*              |
#    verify non existing tuple
      | $.places[0].city                                                  | does not exists          |
#   below is another step to use for response validation with ',' separator, use '\,' if it is part of your validation
    Then verify response body is JSON with tuple(s):country:Australia,['country abbreviation']:AU
#   below step is used to resend exactly same request, just in case if the previous request is not successful
    Then resend request for 3 time(s), until JSON response body has
      | country | Australia |
#   below step is used if you just want to make sure the request is sent and response code is 2xx
    Given a request is sent to end point, expecting success response code
      | details zippopotam/endPoints/get-location-using-country-postcode.yml |
#   below step is used if you just want to make sure the request is sent and response code is 4xx
    Given a request is sent to end point, expecting client error response code
      | details zippopotam/endPoints/get-location-using-country-postcode.yml |
      | path_var country:US                                                  |