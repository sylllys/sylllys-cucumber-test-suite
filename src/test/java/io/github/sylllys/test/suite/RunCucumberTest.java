package io.github.sylllys.test.suite;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(

    features = "src/test/resources/features/",

    glue = {"io.github.sylllys.cucumber.hooks",
        "io.github.sylllys.cucumber.stepDefinitions",
        "io.github.sylllys.test.suite.stepDefinitions"},

    monochrome = true,

    plugin = {"html:target/cucumber-html-report.html"}

)

public class RunCucumberTest {

}
