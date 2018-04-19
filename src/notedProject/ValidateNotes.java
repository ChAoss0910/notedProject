package notedProject;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class ValidateNotes
 */
@WebServlet("/ValidateNotes")
public class ValidateNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private boolean isMultipart;
	 private int maxFileSize = 1024 * 1024 * 10;
	 private int maxMemSize = 100 * 1024;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 try {
	        request.setCharacterEncoding("utf-8");  
	        response.setCharacterEncoding("utf-8");  
	        response.setContentType("text/html;charset=utf-8");  
	        LoadDatabase database=new LoadDatabase();
	        // check if there is a file request
	        isMultipart = ServletFileUpload.isMultipartContent(request);
	        String result = "";
	        String newpath="";
	        response.setContentType("text/html;charset=utf-8");
	        if (!isMultipart) {
	            result = "don't get the file";
	            response.getWriter().println(result);
	            return;
	        }
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        
	        factory.setSizeThreshold(maxMemSize);
	        // Location to save data that is larger than maxMemSize.
	        String path = "/Users/emilymeschke/Desktop/file/";
	        factory.setRepository(new File(path));
	       
	        ServletFileUpload upload = new ServletFileUpload(factory);
	       
	        upload.setSizeMax(maxFileSize);
//	        System.out.println("wtf?");
	        try {
	            // parse request
	        	 	List<String> pList = new ArrayList<String>();  
	            List fileItems = upload.parseRequest(request);
	            System.out.println(fileItems.size());
	            // process iterator
	            Iterator i = fileItems.iterator();
	            if(!i.hasNext())
	            		System.out.println("bieba");
	            while (i.hasNext()) {
	            		System.out.println("in loop");
	                FileItem fi = (FileItem) i.next();
	                if(fi.isFormField()) {
	                		String value = fi.getString("UTF-8");  
	                		pList.add(value);
	                }
	                if (!fi.isFormField()) {
	                    // get para
	                		System.out.println("get Para");
	                    String fieldName = fi.getFieldName();
	                    String fileName = fi.getName();
	                    String contentType = fi.getContentType();
	                    boolean isInMemory = fi.isInMemory();
	                    long sizeInBytes = fi.getSize();
	                    // write file
	                    System.out.println(pList.get(3));
	                    
	                    File file = new File(path + pList.get(4)+"_"+pList.get(0) + ".txt");
	                    fi.write(file);
	                }
	            }
	            String title = pList.get(0);
				String course= pList.get(1);
				String date=pList.get(2);
				String filename=pList.get(3);
				String username=pList.get(4);
				String tag=pList.get(5);
				course = course.replaceAll(" +","");
				String url=pList.get(6);
				
				System.out.println(title);
				System.out.println(course);
				System.out.println(date);
	            
	            System.out.println("Success");
	            
	            Note n=new Note(title, date, course, tag);
	            newpath = path+username+"_"+title+".txt";
	            n.addPath(newpath);
	            database.getUser(username).addNote(n);
//	            RequestDispatcher dispatcher = request.getRequestDispatcher("/coursePage.jsp?username="+username+"&url="+url+"&courseTitle="+course);  
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/homepage.jsp?username="+username+"&url="+url);  

	            dispatcher.forward(request, response);  
	        } catch (Exception ex) {
	        	ex.printStackTrace();
	            System.out.println("No");
	        }
	 

	         System.out.println("Success!!!");
     
	        
		 }catch(Exception e) {
			 System.out.println(e.getMessage());
		 }
		 
		  
		   }  
}


