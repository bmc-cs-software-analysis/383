import com.microsoft.z3.*;

public class HW5Part1 {

    public static void main(String[] args) {
        //setup solver
        Context ctx = new Context(); 
        Solver solver = ctx.mkSolver();

        //declare boolean variables p, q, and r
        BoolExpr p = ctx.mkBoolConst("p");
        BoolExpr q = ctx.mkBoolConst("q");
        BoolExpr r = ctx.mkBoolConst("r");

        //(p V q)
        BoolExpr clause1 = ctx.mkOr(p,q);
        //(p V ~r)
        BoolExpr clause2 = ctx.mkOr(p,ctx.mkNot(r));


        //(p V q) ^ (p V ~r) 
        solver.add(ctx.mkAnd(clause1, clause2));

        //query the solver
        System.out.println(solver.check());
        //get the last model - returns null if it is UNSAT
        System.out.println(solver.getModel());
    }
}
