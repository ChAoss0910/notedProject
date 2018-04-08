package notedProject;

/**
 * @author Burt1
 *Only for testing purpose
 */
public class Test {
	public static void main(String[] args) {
		LoadDatabase database = new LoadDatabase();
		database.loadData();
		System.out.println("Read");
		if (database.CheckUserExist("user1")) {
			System.out.println("Exist");
		}
		return;
	}
}
