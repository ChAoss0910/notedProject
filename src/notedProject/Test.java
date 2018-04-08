package notedProject;

import java.util.ArrayList;
import java.util.List;


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
		
		System.out.println("Check Course");
		String title = "csci201";
		Course course;
		
		List<Integer> choices = new ArrayList<Integer>();
		List<Integer> multiplier = new ArrayList<Integer>();
		for (int i = 0; i < 3; i++) {
			choices.add(4);
			multiplier.add(1);
		}
		
		if (database.CheckCourseByTitle(title)) {
			System.out.println("Has Course");
			course = database.GetCourseByTitle(title);
			Quiz newQuiz = course.GenerateQuiz("Test Quiz", 3);
			for (int i = 0 ; i < newQuiz.GetQuizSize(); i++) {
				Question temp = newQuiz.GetNextQuestion();
				System.out.println(temp.getTitle());
				List<String> options = temp.getOptions();
				for (String s: options) {
					System.out.println(s);
				}
				System.out.println("Answer: " + temp.getAnswer());
			}
			System.out.println("Get score: " + newQuiz.GetScore(choices, multiplier));
		}
		
		return;
	}
}
