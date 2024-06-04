public class Lab4 {   
    public static void main(String[] args){ 
	Sandwich burger = new Sandwich("Cheeseburger",2.75);
	Sandwich club = new Sandwich("Club Sandwich", 2.75);
	Salad spinachSalad = new Salad("Spinach Salad",1.25);
	Salad coleslaw = new Salad("Coleslaw", 1.25);
	Drink orange = new Drink("Orange Soda", 1.25);
	Drink cap = new Drink("Cappuccino", 3.50);
	// Ex1 
	System.out.println(burger.getName()+ " " + burger.getPrice());
	System.out.println(club.getName()+ " " + club.getPrice());
	System.out.println(spinachSalad.getName()+ " " +
			   spinachSalad.getPrice());
	System.out.println(coleslaw.getName()+ " " +
			   coleslaw.getPrice());
	System.out.println(orange.getName()+ " " + orange.getPrice());
	System.out.println(cap.getName()+ " " + cap.getPrice());

	//Ex2
	Trio trio1 = new Trio(burger, spinachSalad, orange);
	System.out.println(trio1.getName());
	System.out.println(trio1.getPrice());
	Trio trio2 = new Trio(club,coleslaw,cap);
	System.out.println(trio2.getName());
	System.out.println(trio2.getPrice());	     
    }
}
