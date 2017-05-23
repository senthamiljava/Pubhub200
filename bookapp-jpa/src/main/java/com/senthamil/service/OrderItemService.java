package com.senthamil.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.senthamil.model.OrderItem;
import com.senthamil.repository.BookRepository;
import com.senthamil.repository.OrderItemRepository;

@Service
public class OrderItemService {

	@Autowired
	private OrderItemRepository orderItemRepository;
	
	@Autowired
	private BookRepository bookRepository;

	public void save(OrderItem orderItem) {
		orderItemRepository.save(orderItem);
	}


}
