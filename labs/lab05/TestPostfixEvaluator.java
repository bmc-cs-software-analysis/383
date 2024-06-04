import org.junit.Test;
import static org.junit.Assert.assertEquals; 


/** Class that tests the PostfixEvaluator.
 *  @author Adam Poliak
 **/
public class TestPostfixEvaluator {


    /** Tests multiplication.
    * @result 9 9 * should be 81
    * @throws PostfixEvaluator.SyntaxErrorException if syntax is off
    */
    @Test
    public void testMult() throws PostfixEvaluator.SyntaxErrorException {
        PostfixEvaluator evaluator = new PostfixEvaluator();
        String line = "9 9 *";
        assertEquals(81, evaluator.eval(line));
    }

    @Test
    public void testDivide() throws PostfixEvaluator.SyntaxErrorException {
        PostfixEvaluator evaluator = new PostfixEvaluator();
        String line = "9 9 /";
        assertEquals(1,evaluator.eval(line));
    }

    @Test
    public void testAdd() throws PostfixEvaluator.SyntaxErrorException {
        PostfixEvaluator evaluator = new PostfixEvaluator();
        String line = "9 9 +";
        assertEquals(18,evaluator.eval(line));
    }

    @Test
    public void testSub() throws PostfixEvaluator.SyntaxErrorException {
        PostfixEvaluator evaluator = new PostfixEvaluator();
        String line = "9 9 -";
        assertEquals(0,evaluator.eval(line));
    }

    //TODO: add 4 more tests here. They should combine multiple operators
}
