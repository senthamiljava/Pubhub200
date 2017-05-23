package com.senthamil.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.senthamil.dto.BookSalesResult;

@Repository
public class BookSalesRepository {

	@PersistenceContext
	private EntityManager entityManager;

	
	public List<BookSalesResult> findBookSales(){
		System.out.println("EntityManager = " + entityManager);
		String sql = "SELECT  b.id, b.name, b.price, SUM(quantity) quantity, SUM(total_price) total_sales FROM books b, orders o , order_items ot WHERE o.id = ot.order_id AND ot.book_id= b.id GROUP BY b.name order by quantity desc";
		Query createNativeQuery = entityManager.createNativeQuery(sql, "BookSalesResult");
		
		List<BookSalesResult> resultList = createNativeQuery.getResultList();
		return resultList;
	}
}
