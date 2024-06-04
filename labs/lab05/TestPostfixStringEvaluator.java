import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TestPostfixStringEvaluator {

    @Test
    public void testMult() throws PostfixStringEvaluator.SyntaxErrorException {
        PostfixStringEvaluator evaluator = new PostfixStringEvaluator();
        String line = "99 9 *";
        assertEquals("( 99 * 9 )", evaluator.eval(line));
    }

    @Test
    public void testTwoOperands() throws PostfixStringEvaluator.SyntaxErrorException {
        PostfixStringEvaluator evaluator = new PostfixStringEvaluator();
        String line = "5 6 + 9 *";
        assertEquals("( ( 5 + 6 ) * 9 )", evaluator.eval(line));
    }

    @Test
    public void testThreeOperandsInARow() throws PostfixStringEvaluator.SyntaxErrorException {
        PostfixStringEvaluator evaluator = new PostfixStringEvaluator();
        String line = "8 9 10 + *";
        assertEquals("( ( 9 + 10 ) * 8 )", evaluator.eval(line));
    }

    // TODO: add 4 more tests here. They should combine multiple operators
}
