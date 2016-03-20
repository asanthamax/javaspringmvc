package thilina.spring.dao;

import java.util.List;

import thilina.spring.bean.Customer;

public interface CustomerDao {

	public void create(Customer customer);

	public void update(Customer customer);

	public boolean deleteById(String Id);

	public Customer findById(String Id);

	public List<Customer> getAllCustomers();
}
