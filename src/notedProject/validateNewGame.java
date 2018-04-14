package notedProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.nashorn.internal.ir.Splittable.SplitRange;

/**
 * Servlet implementation class validateNewGame
 */
@WebServlet("/ValidateNewGame")
public class validateNewGame extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("lalala");
		String coursename = request.getParameter("selectClass");
		String title = request.getParameter("gameName");
		String numPlayers = request.getParameter("numPlayers");
		String forward="";
		PrintWriter out =  response.getWriter();
		if (coursename.equals("Class")||title ==null||numPlayers.equals("Players")) {
			out.print("none");
			out.flush();
			out.close();
		}
	
		else {

			request.getSession().setAttribute("course", coursename);
			request.getSession().setAttribute("numPlayers", numPlayers);
			request.getSession().setAttribute("gameName", title);
			
		}

//		LoadDatabase database = (LoadDatabase) request.getSession(false).getAttribute("database");
//		Course course = database.GetCourseByTitle(coursename);
//		Quiz newQuiz = course.GenerateQuiz(coursename, 3);
//		
//		for (int i = 0 ; i < newQuiz.GetQuizSize(); i++) {
//			Question temp = newQuiz.GetNextQuestion();
//			System.out.println(temp.getTitle());
//			List<String> options = temp.getOptions();
//			
//			for (String s: options) {
//				
//				System.out.println(s);
//			}
//			System.out.println("Answer: " + temp.getAnswer());
//		}
		
		
	}

}
