package notedProject;


import java.awt.Image;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;






public class PDFScreenShot {
	public static void main(String[] args) {
		PDFScreenShot a = new PDFScreenShot();
		
		if(a.check())
			System.out.println("shufu");
	}
	public boolean check() {
		String source ="/Users/chenchaoyang/Desktop/hello.pdf";
		String target ="/Users/chenchaoyang/Desktop/file/hello";
		File file = new File(source);
	    if (!file.exists()) {
	      System.err.println("The path[" + source + "]does not exist!");
	      return false;
	    }
	    try{
	      RandomAccessFile raf = new RandomAccessFile(file, "r");
	      FileChannel channel = raf.getChannel();
	      ByteBuffer buf = channel.map(FileChannel.MapMode.READ_ONLY, 0, channel.size());
	      PDFFile pdffile = new PDFFile(buf);
	      int num = pdffile.getNumPages();
	      for(int i = 1; i <= num; i++){
	         PDFPage page = pdffile.getPage(1);
	          // get the width and height for the doc at the default zoom
	          Rectangle rect = new Rectangle(0, 0, (int) page.getBBox()
	              .getWidth(), (int) page.getBBox().getHeight());
	          // generate the image
	          Image img = page.getImage(rect.width, rect.height, // width &
	              rect, // clip rect
	              null, // null for the ImageObserver
	              true, // fill background with white
	              true // block until drawing is done
	              );
	          BufferedImage tag = new BufferedImage(rect.width, rect.height,   BufferedImage.TYPE_INT_RGB);
	          tag.getGraphics().drawImage(img, 0, 0, rect.width, rect.height,null);
	          FileOutputStream out = new FileOutputStream(target+2+".jpg");
	          JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
	          encoder.encode(tag); // JPEG编码
	          out.close();
	      }
	      return true;
	    }catch(Exception e){
	      e.printStackTrace();
	       return true;
	    }
	}
}
