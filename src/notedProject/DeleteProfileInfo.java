package notedProject;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteProfileInfo")
public class DeleteProfileInfo extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String username = (String) request.getParameter("username");
		String del = (String) request.getParameter("delete");
		String tp = (String) request.getParameter("type");
		int delete = -1;
		int type = -1;
		try {
			delete = Integer.parseInt(del);
			type = Integer.parseInt(tp);
		} catch (NumberFormatException nfe) {
		}
		
		LoadDatabase database = new LoadDatabase();
		database.Remove(username, delete, type);		
	}
}

