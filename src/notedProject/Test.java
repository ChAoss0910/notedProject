package notedProject;

/**
 * @author Burt1
 *Only for testing purpose
 */
public class Test {
	public static void main(String[] args) {
		
		LoadDatabase database = new LoadDatabase("database.json");
		System.out.println("Read");
		if (database.CheckUserExist("user1")) {
			System.out.println("Exist");
		}
		if (database.CheckLogin("user1", "111111")) {
			System.out.println("Correct login");
		}
		return;
	}
}