package com.bank.main;

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

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
	        PrintWriter out = response.getWriter();

	        String name = request.getParameter("name");
	        long phone = Long.parseLong(request.getParameter("phone"));
	        String mail = request.getParameter("mail");
	        int pin = Integer.parseInt(request.getParameter("pin"));

	        CustomerDao cdao = new CustomerDaoImp();
	        Customer c = new Customer();
	        c.setName(name);
	        c.setMail(mail);
	        c.setPhone(phone);
	        c.setPin(pin);

	        if (cdao.insertCustomer(c)) {
	            // Set customer object in session
	            HttpSession session = request.getSession();
	            session.setAttribute("customer", c);
	            response.sendRedirect("home.jsp");  // Redirect to home page
	        } else {
	            response.sendRedirect("register.jsp?error=registration failed");
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
