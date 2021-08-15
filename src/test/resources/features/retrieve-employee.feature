@regression @rest-api-example @retrieve-employee-api
Feature: retrieve employee rest api

  @smoke
  Scenario: verify employee can be retrieved using rest api
    Given a request is sent to end point
      | details restapiexample/endPoints/createEmployee.yml |
    Then verify response code is 200
    Given a request is sent to end point
      | details restapiexample/endPoints/retrieveEmployee.yml |
    Then verify response code is 200
    Then verify response body is JSON with tuple(s)
      | message | Successfully! Record has been fetched. |
    Then print {global:createEmployee.response.data.id}
    