package com.senthamil.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;

import com.senthamil.dto.BookSalesResult;

import lombok.Data;

@Data
@Entity
@Table(name = "books")
@SqlResultSetMapping(name = "BookSalesResult", classes = {
		@ConstructorResult(targetClass = BookSalesResult.class, columns = {
				@ColumnResult(name = "id", type = Long.class),
				@ColumnResult(name = "name", type = String.class),
				@ColumnResult(name = "price", type = Integer.class),
				//@ColumnResult(name = "released_date", type = LocalDate.class),
				@ColumnResult(name = "quantity", type = Long.class),
				@ColumnResult(name = "total_sales", type = Long.class) }) })
public class Book {

	@Id
	@Column(name = "id")
	private Long id;

	@Column(name = "name")
	private String name;

	@Column(name = "price")
	private Integer price;

	@Column(name = "released_date")
	private LocalDate releasedDate;
}
