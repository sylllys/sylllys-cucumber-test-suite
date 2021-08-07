package io.github.sylllys.test.suite.stepDefinitions;

import io.cucumber.java.en.When;

public class CustomStepDefinitions {

  @When("^say hello world!$")
  public void sayHelloWorld() throws Exception {
    System.out.println("Hello world!");
  }
}
