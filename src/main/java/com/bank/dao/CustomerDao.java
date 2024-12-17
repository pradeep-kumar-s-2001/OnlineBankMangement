package com.bank.dao;

import java.util.List;

import com.bank.dto.Customer; 

public interface CustomerDao {
	
	public boolean insertCustomer(Customer c); 
	public Customer getCustomer(long acc_no,int pin); 
	public Customer getCustomer(long phone,String mail); 
	public Customer getCustomer(long acc_no); 
	public List getCustomer(); 
	public boolean updateCustomer(Customer c); 
	public boolean deleteCustomer(Customer c); 
	
}
