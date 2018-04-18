package notedProject;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddProfileInfo
 */
@WebServlet("/AddProfileInfo")
public class AddProfileInfo extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String username = (String) request.getParameter("username");
		String ad = (String) request.getParameter("title");
		String tp = (String) request.getParameter("type");
		int add = -1;
		int type = -1;
		try {
			add = Integer.parseInt(ad);
			type = Integer.parseInt(tp);
		} catch (NumberFormatException nfe) {
		}
		
		LoadDatabase database = new LoadDatabase();
		if (type == 1) { //notes
			database.addNote();	
		} else if (type == 2) { //question
			database.addQuestion();	
		} else if (type == 3) { //course
			database.addCourse();	
		}
	}
}
