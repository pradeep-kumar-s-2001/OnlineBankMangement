package com.bank.dao;
import com.bank.jdbc.*;
import com.bank.dto.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class CustomerDaoImp implements CustomerDao {
	private Connection con;

	public CustomerDaoImp() {
		this.con = ConnectionFactory.requestConnection();
		
	}

	@Override
	public boolean insertCustomer(Customer c) {
		PreparedStatement ps = null;
		String query = "INSERT INTO CUSTOMER(NAME,PHONE,MAIL,PIN)VALUES(?,?,?,?)";

		int res = 0;
		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setLong(2, c.getPhone());
			ps.setString(3, c.getMail());
			ps.setInt(4, c.getPin());
			res = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (res > 0) {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		} else {
			try {
				con.rollback();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
	}

	@Override
	public Customer getCustomer(long acc_no, int pin) {
		PreparedStatement ps=null; 
		  ResultSet rs=null; 
		  Customer c=null; 
		  String query="SELECT * FROM CUSTOMER WHERE ACC_NO=? AND PIN=?"; 
		
		  try { 
		   ps=con.prepareStatement(query); 
		   ps.setLong(1,acc_no); 
		   ps.setInt(2, pin); 
		   rs=ps.executeQuery(); 
		   if(rs.next()) 
		   { 
		    c=new Customer(); 
		    c.setAcc_no(rs.getLong(1)); 
		    c.setName(rs.getString(2)); 
		    c.setPhone(rs.getLong(3)); 
		    c.setMail(rs.getString(4)); 
		    c.setBalance(rs.getDouble(5)); 
		    c.setPin(rs.getInt(6)); 
		   } 
		} catch (SQLException e) { 
		// TODO Auto-generated catch block
		 e.printStackTrace(); 
		} 
		return c; 
		}
	

	@Override
	public Customer getCustomer(long phone, String mail) {
		PreparedStatement ps=null; 
		  ResultSet rs=null; 
		  Customer c=null; 
		  String query="SELECT * FROM CUSTOMER WHERE PHONE=? AND MAIL=?"; 
		
		  try { 
		   ps=con.prepareStatement(query); 
		   ps.setLong(1,phone); 
		   ps.setString(2, mail); 
		   rs=ps.executeQuery(); 
		 
		   if(rs.next()) 
		   { 
		    c=new Customer(); 
		    c.setAcc_no(rs.getLong(1)); 
		    c.setName(rs.getString(2)); 
		    c.setPhone(rs.getLong(3)); 
		    c.setMail(rs.getString(4)); 
		    c.setBalance(rs.getDouble(5)); 
		    c.setPin(rs.getInt(6)); 
		   } 
		  } catch (SQLException e) { 
		   // TODO Auto-generated catch block 
		   e.printStackTrace(); 
		  } 
		  return c; 
		 }

	@Override
	public Customer getCustomer(long acc_no) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=new Customer();
		String query="select * from customer where acc_no=?";
		
		try {
			ps=con.prepareStatement(query);
			
			ps.setLong(1, acc_no);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				c.setAcc_no(rs.getLong(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setBalance(rs.getDouble(5));
				c.setPin(rs.getInt(6));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return c;
	}

	@Override
	public List getCustomer() {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		ArrayList<Customer> customer=new ArrayList<Customer>();
		String query="select * from customer";
		
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				c=new Customer();
				c.setAcc_no(rs.getLong(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setBalance(rs.getDouble(5));
				c.setPin(rs.getInt(6));
				customer.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return customer;
	}

	@Override
	public boolean updateCustomer(Customer c) {
		Scanner sc =new Scanner(System.in);
		PreparedStatement ps=null;

		String query="update customer set name=?,phone=?,mail=?,balance=?,pin=? where acc_no=?";
		int res=0;
		
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1,c.getName());
			ps.setLong(2, c.getPhone());
			ps.setString(3,c.getMail());
			ps.setDouble(4, c.getBalance());
			ps.setInt(5, c.getPin());
			ps.setLong(6, c.getAcc_no());
			res=ps.executeUpdate();
				
			
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
	
	}

	@Override
	public boolean deleteCustomer(Customer c) {
		PreparedStatement ps=null;

		String query="delete from customer where acc_no=?";
		int res=0;
		
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setLong(1, c.getAcc_no());
			
			res=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
		else { 
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		
		}}
}
