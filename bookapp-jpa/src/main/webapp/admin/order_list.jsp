<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Admin</title>


    <link href="../bower/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../bower/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <link href="../theme/css/datatables.min.css" rel="stylesheet">

    <!-- <link href="../bower/plugins/animate.css/animate.min.css" rel="stylesheet"> --> 
    <link href="../theme/css/animate.css" rel="stylesheet"> 
    <link href="../theme/css/style.css" rel="stylesheet">

</head>

<body>

	<jsp:include page="navbar_layout.jsp"></jsp:include>
	<div id="wrapper">

		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">

				<jsp:include page="header_layout.jsp"></jsp:include>

			</div>
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>Orders</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li><a>Orders</a></li>
						<li class="active"><strong>List</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>List of Orders</h5>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
									</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
										<i class="fa fa-wrench"></i>
									</a> <a class="close-link"> <i class="fa fa-times"></i>
									</a>
								</div>
							</div>
							<div class="ibox-content">

								<div class="table-responsive">
									<table
										class="table table-striped table-bordered table-hover dataTables-example">

										<thead>
											<tr>
												<th width="5%">Sno</th>
												<th>Order Id</th>
												<th>Items</th>
												<th>Bill Amount</th>
												<th>Ordered Date</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ORDERS_LIST}" var="order"
												varStatus="loop">
												<tr>
													<td>${loop.index+1}</td>
													<td>${order.id}</td>
													<td>
														<ul>
															<c:forEach items="${order.orderItems}" var="item">
																<li>${item.book.name }(Qty - ${item.quantity } )</li>
															</c:forEach>
														</ul>
													</td>
													<%-- <td>${order.quantity}</td> --%>
													<td>Rs. ${order.totalPrice }</td>
													<td>${order.orderedDate }</td>

													<td>
													<c:if test="${order.status == 'ORDERED'}">
															<span class="badge badge-primary">${order.status }</span>
														</c:if>
														<c:if test="${order.status == 'DELIVERED'}">
															<span class="badge badge-success">${order.status }</span>
														</c:if> <c:if test="${order.status =='CANCELLED'}">
															<span class="badge badge-danger">${order.status }</span>
														</c:if></td>
													<c:if
														test="${order.status !='CANCELLED' && order.status != 'DELIVERED'}">
														<td><a
															href="../admin/orders/updateStatus?id=${order.id}&status=DELIVERED"
															class="btn btn-success btn-sm">Deliver Order </a></td>
													</c:if>
													<c:if test="${order.status == 'ORDERED'}">
														<td><a
															href="../admin/orders/updateStatus?id=${order.id}&status=CANCELLED"
															class="btn btn-danger btn-sm">Cancel Order </a></td>
													</c:if>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer">
				<div class="pull-right">
					<!--   10GB of <strong>250GB</strong> Free. -->
				</div>
				<div>
					<strong>Developed By</strong> Revature - Training Team &copy; 2017
				</div>
			</div>

		</div>
	</div>


    <!-- Mainly scripts -->
    <script src="../bower/plugins/jquery/jquery.min.js"></script>
    <script src="../bower/plugins/bootstrap/bootstrap.min.js"></script>
     <script src="../bower/plugins/metismenu/metisMenu.min.js"></script>
    <script src="../bower/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script> 

    <script src="../theme/js/plugins/dataTables/datatables.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="../theme/js/inspinia.js"></script>
    <!-- <script src="../theme/js/plugins/pace/pace.min.js"></script>  -->

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function(){
          $('.dataTables-example').DataTable();
        });

    </script>

</body>

</html>
