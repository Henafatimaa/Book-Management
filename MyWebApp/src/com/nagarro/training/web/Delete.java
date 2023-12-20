package com.nagarro.training.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nagarro.training.dao.RecordsDao;
/**Author HenaFatima*/

@WebServlet("/delete")
public class Delete extends HttpServlet {
    
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request,
           HttpServletResponse response) throws ServletException, IOException {
   	
   	String pid = request.getParameter("id");
   	int id = Integer.valueOf(pid);
   	System.out.println(id);
       String title = request.getParameter("title");
       String quantity = request.getParameter("quantity");
       String size = request.getParameter("size");
       String image = request.getParameter("image");
       
       System.out.println(id);
       System.out.println(title);
       System.out.println(quantity);
       System.out.println(size);
       System.out.println(image);

       HttpSession session = request.getSession(true);
       try {
       	
       	
           RecordsDao recordsDAO = new RecordsDao();
           recordsDAO.deleteProductDetails(id);
           recordsDAO.getProducts();
           response.sendRedirect("product-management.jsp");
       } catch (Exception e) {

           e.printStackTrace();
       }
   }
   }

