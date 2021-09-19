package io.github.sylllys.test.suite.stepDefinitions;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.github.sylllys.cucumber.utilities.DataMiner;
import org.apache.commons.lang3.StringUtils;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class CustomStepDefinitions {

  @When("^say hello world!$")
  public void sayHelloWorld() throws Exception {
    System.out.println("Hello world!");
  }

  @Then("^assert (.*) and (.*) are the same$")
  public void assertAreSame(String source, String target) throws Exception {

    source = DataMiner.refactor(source);
    target = DataMiner.refactor(target);

    assertTrue("Asserting expected:" + source + " and actual:" + target + " are not same",
        StringUtils.equals(source == null ? null : source.toString(), target));
  }

  @Then("^assert (.*) and (.*) are not the same$")
  public void assertAreNotSame(String source, String target) throws Exception {

    source = DataMiner.refactor(source);
    target = DataMiner.refactor(target);

    assertFalse("Asserting expected:" + source + " and actual:" + target + " are same",
        StringUtils.equals(source, target));

  }

  @Then("^assert (.*) and (.*) does match$")
  public void assertAreMatch(String source, String target) throws Exception {

    source = DataMiner.refactor(source);
    target = DataMiner.refactor(target);

    assertTrue("Asserting expected:" + source + " and actual:" + target + " does not match",
        source.matches(target));
  }
}
