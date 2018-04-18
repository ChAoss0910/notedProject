package notedProject;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;

public class TransferPDF {
	 private final static String READFILEPATH = "/Users/chenchaoyang/Desktop/hello.txt";  //txt     
	    private final static String WRITEFILEPATH = "/Users/chenchaoyang/Desktop/hello.pdf"; //pdf     
	    
	    public static void main(String[] args) throws DocumentException,     
	            IOException {     
	        Document document = new Document(PageSize.A4, 80, 80, 60, 30);     
	        PdfWriter.getInstance(document, new FileOutputStream(WRITEFILEPATH));     
	        document.open();     
	        BaseFont bfChinese = BaseFont.createFont("./WebContent/WEB-INF/lib/SIMSUN.TTF",     
	        		BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);     
	        Font FontChinese = new Font(bfChinese, 18, Font.NORMAL);     
	        Paragraph t = new Paragraph("Note", FontChinese); //give a title  
	        t.setAlignment(Element.ALIGN_CENTER);     
	        t.setLeading(30.0f);     
	        document.add(t);     
	        FontChinese = new Font(bfChinese, 11, Font.NORMAL);     
	        BufferedReader read = null;     
	        try {     
	            read = new BufferedReader(new FileReader(READFILEPATH));     
	            String line = null;     
	            while ((line = read.readLine()) != null) {     
	                t = new Paragraph(line, FontChinese);     
	                t.setAlignment(Element.ALIGN_LEFT);     
	                t.setLeading(20.0f);     
	                document.add(t);     
	            }     
	        } catch (Exception e) {     
	            System.out.println("File not exist");     
	            e.printStackTrace();     
	        } finally {     
	            try {     
	                read.close();     
	                document.close();     
	            } catch (IOException e) {     
	                e.printStackTrace();     
	            }     
	        }     
	        System.out.println("============Successful！===========");     
	    }     
}
