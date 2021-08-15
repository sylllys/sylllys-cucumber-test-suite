@regression @rest-api-example @create-employee-api
Feature: create employee rest api

  @smoke
  Scenario: verify employee can be created using rest api
    Given a request is sent to end point
      | details restapiexample/endPoints/createEmployee.yml |
    Then verify response code is 200
    Then verify response body is JSON with tuple(s):data.id=regex \d+
    Then print {global:createEmployee.response.data.id}
