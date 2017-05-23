<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Summary</title>
</head>
<body>

	<table border=1>
		<tr>
			<th>Order id</th>
			<th>User Name</th>
			<th>Book Name</th>
			<th>Book Quantity</th>
			<th>Total Price</th>
		</tr>
		<c:forEach items="${orders}" var="order">
			<tr>
				<td>order</td>
				<td><input type="text" name="book_id" value="${book.id}" /></td>
				<td><input type="text" name="book_name" value="${book.name}" /></td>
				<td><input type="text" name="book_price" value="${book.price}" /></td>
				<td><input type="text" name="book_quantity" /></td>
				<td><button type="submit">add to cart</button>
			</tr>
		</c:forEach>
	</table>

</body>
</html>