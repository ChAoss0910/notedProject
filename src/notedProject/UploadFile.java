package notedProject;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.jrockit.jfr.RequestableEvent;

/**
 * Servlet implementation class UploadFile
 */
@WebServlet("/UploadFile")
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("come in other");
		 String title = request.getParameter("notesTitle");
			String course= request.getParameter("selectClass");
			String date=request.getParameter("date");
			String file=request.getParameter("uploadfile");
			String tag=request.getParameter("tags");
			String username=request.getParameter("username");
			String url=request.getParameter("url");
			PrintWriter out =  response.getWriter();
			LoadDatabase database=new LoadDatabase();
			
			System.out.println(title);
			System.out.println(course);
			System.out.println(date);
			System.out.println(file);
			System.out.println(tag);
			System.out.println(username);
			System.out.println(url);
			Note n=  new Note(title,date,course,tag);
//			try {
//				Thread.sleep(50);
//			} catch (InterruptedException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/homepage.jsp?username="+username+"&url="+url);  
//        dispatcher.forward(request, response);  
	}

}
