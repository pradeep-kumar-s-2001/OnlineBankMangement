package com.bank.main;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.bank.dao.CustomerDao;
import com.bank.dao.CustomerDaoImp;
import com.bank.dto.Customer;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        long acc_no = Long.parseLong(request.getParameter("acc_no"));
	        int pin = Integer.parseInt(request.getParameter("pin"));
	        
	        CustomerDao cdao = new CustomerDaoImp();
	        Customer c = cdao.getCustomer(acc_no, pin);

	        if (c != null) {
	        	if(c.getAcc_no()==1100110011) {
	           
	            HttpSession session = request.getSession();
	               session.setAttribute("role", "admin");
	                        session.setAttribute("customer", c);
	            response.sendRedirect("adminHome.jsp");  
	        	}
	        	else
	        	{
	        		HttpSession session = request.getSession();
	            session.setAttribute("role", "customer");
	            session.setAttribute("customer", c);
	response.sendRedirect("home.jsp");  
	        	        	
	        	}
	        } else {
	            request.setAttribute("error", "Invalid Credentials");
	            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
	            rd.forward(request, response);
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
