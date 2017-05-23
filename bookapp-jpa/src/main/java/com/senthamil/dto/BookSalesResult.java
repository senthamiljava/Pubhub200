package com.senthamil.dto;


import com.senthamil.model.Book;

import lombok.Data;

@Data
public class BookSalesResult {

	public BookSalesResult() {
		super();
	}

	public BookSalesResult(Long id, String name, Integer price, Long totalQuantity, Long totalSales) {
		System.out.println(id+"-"+ name +"-" + price +"-" + totalQuantity + "-" + totalSales);
		this.book = new Book();
		this.book.setId(id);
		this.book.setName(name);
		this.book.setPrice(price);
		//this.book.setReleasedDate(releasedDate);
		this.totalQuantity = totalQuantity;
		this.totalSales = totalSales;
	}

	private Book book;
	
	private Long totalQuantity;

	private Long totalSales;
	
}
