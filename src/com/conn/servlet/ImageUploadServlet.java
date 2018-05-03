package com.conn.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.conn.dao.CandidateProfileImp;
import com.conn.dao.CandidateProfileInt;
import com.conn.dao.SignUpImp;
import com.conn.dao.SignUpInt;
import com.conn.pojo.CandidateProfile;


/**
 * Servlet implementation class UploadServlet
 */
public class ImageUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DATA_DIRECTORY = "Profile image";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	
        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = getServletContext().getRealPath("")
        		+ File.separator + DATA_DIRECTORY+ File.separator;

        File file=new File(uploadFolder);
        if(!file.exists()){
        	file.mkdir();
        }
        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);
       
        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                	
                	
                		
                		int userID=(Integer)request.getSession().getAttribute("userId");
                        String fileName = new File(item.getName()).getName();
                        String renameFile=userID+fileName;
                        String filePath = uploadFolder + renameFile;
                        File uploadedFile = new File(filePath);
                     //   System.out.println(filePath);
                        // saves the file to upload directory
                        item.write(uploadedFile);
                        
                        
                     //   System.out.println("userID"+userID);
                        CandidateProfile cp=new CandidateProfile();
                        cp.setProfile_image(renameFile);
                        cp.setCan_id(userID);
                        CandidateProfileInt intf=new CandidateProfileImp();
                        intf.addCandidateImage(cp);
                        SignUpInt intf1=new SignUpImp();
                        String usertype=intf1.getUserType(userID);
        			//	System.out.println("usertype"+usertype);
        				
        				if(usertype.equalsIgnoreCase("Candidate"))
        				{
        				response.sendRedirect("UserHomeServlet?userId="+userID);
        				}
        				if(usertype.equalsIgnoreCase("Client"))
        				{
        					response.sendRedirect("ClientHomeServlet?userId="+userID);
        					}
        				
                	}
            
                }
            
            

        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }

    }

}