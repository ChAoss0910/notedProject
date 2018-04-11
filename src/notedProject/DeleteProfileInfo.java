package notedProject;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteProfileInfo")
public class DeleteProfileInfo extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String myName = (String) request.getParameter("myName");
		String aName = (String) request.getParameter("aName");
		String follow = (String) request.getParameter("follow");
		
		if (follow.equalsIgnoreCase("unfollowButton")) { //switch from follow to unfollow
//			u.unfollow(myName, aName);
		} else { //switch from unfollow to follow
//			u.follow(myName, aName);
		}
	}
}

