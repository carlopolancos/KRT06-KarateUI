package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ExamplesTest {

    @Test // Standard JUnit 5 annotation
    void testParallel() {
        Results results = Runner.path("classpath:examples/users")
                .tags("@tag22")
//                .tags("@confidence, @smoke, @regression") //Comma = OR
//    			.tags("@confidence", "@smoke", "@regression") // Separate args = AND
//                .reportDir("target/karate-reports/tags-run")
                .outputCucumberJson(true)
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
