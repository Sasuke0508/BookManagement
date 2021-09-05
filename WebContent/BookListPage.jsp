<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet"
	href=<c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>>
<link rel="stylesheet"
	href=<c:url value = "https://cdn.datatables.net/1.10.14/css/jquery.dataTables.min.css"/>>
<link rel="stylesheet"
	href=<c:url value = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>>
<link rel="stylesheet"
	href=<c:url value = "https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,800&display=swap"/>>
<link rel="stylesheet" href=<c:url value = "css/style.css"/>>

<title>Responsive DataTable UI Design</title>

<style>
@charset "ISO-8859-1";

body {
	font-family: "Raleway", sans-serif;
	background: #f9f9f9;
}

.p-30 {
	padding: 8px 30px;
}

.title {
	text-align: center;
	font-size: 3rem;
	font-weight: 600;
	background-color: crimson;
	color: white;
	/* margin-bottom: 1.5rem; */
	padding: 20px 30px;
	border: 1px solid #f3f2f2;
}

.main-datatable {
	padding: 0px;
	border: 1px solid #f3f2f2;
	border-bottom: 0;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.05);
}

.d-flex {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.card_body {
	background-color: white;
	border: 1px solid transparent;
	border-radius: 2px;
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
}

.main-datatable .row {
	margin: 0;
}

.searchInput {
	width: 50%;
	display: flex;
	align-items: center;
	position: relative;
	justify-content: flex-end;
	margin: 20px 0px;
	padding: 0px 4px;
}

.searchInput input {
	border: 1px solid #e5e5e5;
	border-radius: 50px;
	margin-left: 8px;
	height: 34px;
	width: 100%;
	padding: 0px 25px 0px 10px;
	transition: all 0.6s ease;
}

.searchInput label {
	color: #767676;
	font-weight: normal;
}

.searchInput input:placeholder-shown {
	width: 13%;
}

.searchInput:hover input:placeholder-shown {
	width: 100%;
	cursor: pointer;
}

.searchInput:after {
	font-family: "FontAwesome";
	color: #d4d4d4;
	position: relative;
	content: "\f002";
	right: 25px;
}

.dim_button {
	display: inline-block;
	color: #fff;
	text-decoration: none;
	text-transform: uppercase;
	text-align: center;
	padding-top: 6px;
	background: rgb(57, 85, 136);
	margin-right: 10px;
	position: relative;
	cursor: pointer;
	font-weight: 600;
	margin-bottom: 20px;
}

.createSegment a {
	margin-bottom: 0px;
	border-radius: 50px;
	background: #ffffff;
	border: 1px solid #007bff;
	color: #007bff;
	transition: all 0.4s ease;
}

.createSegment a:hover, .createSegment a:focus {
	transition: all 0.4s ease;
	background: #007bff;
	color: #fff;
}

.add_flex {
	display: flex;
	justify-content: flex-end;
	padding-right: 0px;
}

.main-datatable .dataTable.no-footer {
	border-bottom: 1px solid #eee;
}

.main-datatable .cust-datatable thead {
	background-color: #f9f9f9;
}

.main-datatable .cust-datatable>thead>tr>th {
	border-bottom-width: 0;
	color: #443f3f;
	font-weight: 600;
	padding: 16px 15px;
	vertical-align: middle;
	padding-left: 18px;
	text-align: center;
}

.main-datatable .cust-datatable>tbody td {
	padding: 10px 15px 10px 18px;
	color: #333232;
	font-size: 13px;
	font-weight: 500;
	word-break: break-word;
	border-color: #eee;
	text-align: center;
	vertical-align: middle;
}

.main-datatable .cust-datatable>tbody tr {
	border-top: none;
}

.main-datatable .table>tbody>tr:nth-child(even) {
	background: #f9f9f9;
}

.btn-group.open .dropdown-toggle {
	box-shadow: none;
}

.main-datatable .dropdown_icon {
	display: inline-block;
	color: #8a8a8a;
	font-size: 12px;
	border: 1px solid #d4d4d4;
	padding: 10px 11px;
	border-radius: 50%;
	cursor: pointer;
}

.btn-group i {
	color: #8e8e8e;
	margin: 2px;
}

.main-datatable .actionCust a {
	display: inline-block;
	color: #8a8a8a;
	font-size: 12px;
	border: 1px solid #d4d4d4;
	padding: 10px 11px;
	margin: -9px 3px;
	border-radius: 50%;
	cursor: pointer;
}

.main-datatable .actionCust a i {
	color: #8e8e8e;
	margin: 2px;
}

.main-datatable .dropdown-menu {
	padding: 0;
	border-radius: 4px;
	box-shadow: 10px 10px 20px #c8c8c8;
	margin-top: 10px;
	left: -65px;
	top: 32px;
}

.main-datatable .dropdown-menu>li>a {
	display: block;
	padding: 12px 20px;
	clear: both;
	font-weight: normal;
	line-height: 1.42857;
	color: #333333;
	white-space: nowrap;
	border-bottom: 1px solid #d4d4d4;
}

.main-datatable .dropdown-menu>li>a:hover, .main-datatable .dropdown-menu>li>a:focus
	{
	color: #fff;
	background: #007bff;
}

.main-datatable .dropdown-menu>li>a:hover i {
	color: #fff;
}

.main-datatable .dropdown-menu:before {
	position: absolute;
	top: -7px;
	left: 78px;
	display: inline-block;
	border-right: 7px solid transparent;
	border-bottom: 7px solid #d4d4d4;
	border-left: 7px solid transparent;
	border-bottom-color: #d4d4d4;
	content: "";
}

.main-datatable .dropdown-menu:after {
	position: absolute;
	top: -6px;
	left: 78px;
	display: inline-block;
	border-right: 6px solid transparent;
	border-bottom: 6px solid #ffffff;
	border-left: 6px solid transparent;
	content: "";
}

.dropdown-menu i {
	margin-right: 8px;
}

.main-datatable .dataTables_wrapper .dataTables_paginate .paginate_button
	{
	color: #999999 !important;
	background-color: #f6f6f6 !important;
	border-color: #d4d4d4 !important;
	border-radius: 40px;
	margin: 5px 3px;
}

.main-datatable .dataTables_wrapper .dataTables_paginate .paginate_button:hover
	{
	color: #fff !important;
	border: 1px solid #3d96f5 !important;
	background: #4da3ff !important;
	box-shadow: none;
}

.main-datatable .dataTables_wrapper .dataTables_paginate .paginate_button.current,
	.main-datatable .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover
	{
	color: #fff !important;
	border-color: transparent !important;
	background: #007bff !important;
}

.main-datatable .dataTables_paginate {
	padding-top: 0 !important;
	margin: 15px 10px;
	float: right !important;
}

.mode {
	padding: 4px 10px;
	line-height: 13px;
	color: #fff;
	font-weight: 400;
	border-radius: 1rem;
	-webkit-border-radius: 1rem;
	-moz-border-radius: 1rem;
	-ms-border-radius: 1rem;
	-o-border-radius: 1rem;
	font-size: 11px;
	letter-spacing: 0.4px;
}

.mode_on {
	background-color: #09922d;
}

.mode_off {
	background-color: #8b9096;
}

.mode_process {
	background-color: #ff8000;
}

.mode_done {
	background-color: #03a9f3;
}

/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
}

.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}

.modal .modal-content {
	border-radius: 3px;
	font-size: 14px;
}

.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}

.modal .modal-title {
	display: inline-block;
}

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}

.modal textarea.form-control {
	resize: vertical;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
}

.selectType {
	display: block;
	width: 100%;
	padding: 8px 12px;
	border-color: #dddddd;
	outline: none;
	cursor: pointer;
}

.selectType option {
	padding: 5px;
}

.action {
	display: inline-block;
	color: #8a8a8a;
	font-size: 12px;
	padding: 10px 13px;
	margin: 2px;
	border: 1px solid #dddddd;
	border-radius: 50%;
	cursor: pointer;
	transition: ease 0.3s;
}

.edit:hover {
	background-color: #3C99F0;
	color: white;
}

.delete:hover {
	background-color: #F04F44;
	color: white;
}

@media only screen and (max-width: 1200px) {
	.overflow-x {
		overflow-x: scroll;
	}
	.overflow-x::-webkit-scrollbar {
		width: 5px;
		height: 6px;
	}
	.overflow-x::-webkit-scrollbar-thumb {
		background-color: #888;
	}
	.overflow-x::-webkit-scrollbar-track {
		background-color: #f1f1f1;
	}
}

@media screen and (max-width: 950px) {
	.searchInput {
		width: 90%;
	}
}

@media screen and (max-width: 579px) {
	.searchInput {
		width: 100%;
	}
}
</style>
</head>
<body>

	<div class="container p-30">
		<div class="row title">
			<i class="fa fa-book"></i> Books Management
		</div>
		<div class="row">
			<div class="col-md-12 main-datatable">
				<div class="card_body">
					<div class="row d-flex">
						<div class="col-sm-4 createSegment">
							<a class="btn dim_button create_new" data-toggle="modal"
								data-target="#addBookModal"> <span
								class="glyphicon glyphicon-plus"></span> Create New
							</a>
						</div>
						<div class="col-sm-8 add_flex">
							<div class="form-group searchInput">
								<label for="email">Search:</label> <input type="search"
									class="form-control" id="filterbox" placeholder=" ">
							</div>
						</div>
					</div>
					<div class="overflow-x">
						<table style="width: 100%;" id="filtertable"
							class="table cust-datatable dataTable no-footer">
							<thead>
								<tr>
									<th style="min-width: 50px;">ID</th>
									<th style="min-width: 150px;">Name</th>
									<th style="min-width: 150px;">Author</th>
									<th style="min-width: 100px;">Type</th>
									<th style="min-width: 100px;">Price</th>
									<th style="min-width: 150px;">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="book" items="${listBook}">
									<tr>

										<td><c:out value="${book.id}" /></td>
										<td><c:out value="${book.title}" /></td>
										<td><c:out value="${book.author}" /></td>
										<c:if test="${book.type == 'Kỹ năng sống'}">
											<td><span class="mode mode_process"><c:out
														value="${book.type}" /></span></td>
										</c:if>
										<c:if test="${book.type == 'Truyện'}">
											<td><span class="mode mode_on"><c:out
														value="${book.type}" /></span></td>
										</c:if>
										<c:if test="${book.type == 'Văn học'}">
											<td><span class="mode mode_done"><c:out
														value="${book.type}" /></span></td>
										</c:if>
										<c:if test="${book.type == 'Khoa học'}">
											<td><span class="mode mode_off"><c:out
														value="${book.type}" /></span></td>
										</c:if>
										<td><fmt:formatNumber type="number" maxFractionDigits = "3"
												value="${book.price}" /> đ</td>
										<td><a class="action edit" data-toggle="modal"
											onclick="setValue('${book.id}', '${book.title}', '${book.type}', '${book.author}', '${book.price}')"
											data-target="#editBookModal"> <i
												class="fa fa-pencil-square-o"></i>
										</a> <a class="action delete" data-toggle="modal"
											data-target="#deleteBookModal"
											onclick="setIdDelete('${book.id}')"><i
												class="fa fa-trash"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Edit Modal HTML -->
	<div id="addBookModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="insert" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Add Book</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Title</label> <input type="text" name="title"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Type</label>
							<!-- <input type="text" class="form-control" required> -->
							<select name="type" class="selectType">
								<option value="Văn học">Văn học</option>
								<option value="Kỹ năng sống">Kỹ năng sống</option>
								<option value="Khoa học">Khoa học</option>
								<option value="Truyện">Truyện</option>
							</select>
						</div>
						<div class="form-group">
							<label>Author</label> <input type="text" name="author"
								class="form-control" required></input>
						</div>
						<div class="form-group">
							<label>Price</label> <input type="number" name="price"
								class="form-control" required>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="editBookModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="update" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Edit Book</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input type="hidden" class="form-control" required value=""
								id="id" name="id">
						</div>
						<div class="form-group">
							<label>Title</label> <input type="text" class="form-control"
								id="title" name="title" required>
						</div>
						<div class="form-group">
							<label>Type</label>
							<!-- <input type="text" class="form-control" required> -->
							<select name="type" class="selectType" id="type">
								<option value="Văn học">Văn học</option>
								<option value="Kỹ năng sống">Kỹ năng sống</option>
								<option value="Khoa học">Khoa học</option>
								<option value="Truyện">Truyện</option>
							</select>
						</div>
						<div class="form-group">
							<label>Author</label> <input type="text" class="form-control"
								required id="author" name="author"></input>
						</div>
						<div class="form-group">
							<label>Price</label> <input type="number" class="form-control"
								required id="price" name="price">
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit" class="btn btn-info"
							value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Delete Modal HTML -->
	<div id="deleteBookModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="delete" method="post">
					<div class="form-group">
						<input type="hidden" class="form-control" required value=""
							id="idDelete" name="id">
					</div>
					<div class="modal-header">
						<h4 class="modal-title">Delete Book</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete these Records?</p>
						<p class="text-warning">
							<small>This action cannot be undone.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-danger" value="Delete">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="<c:url value="https://code.jquery.com/jquery-3.2.1.min.js" />"></script>
	<script type="text/javascript"
		src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" />"></script>
	<script type="text/javascript"
		src="<c:url value="https://cdn.datatables.net/1.10.14/js/jquery.dataTables.min.js" />"></script>

	<script type="text/javascript" src="<c:url value="js/main.js" />"></script>
	<script>
		$(document).ready(function() {
			/* 	if ( !$.fn.dataTable.isDataTable( '#filtertable' ) ){ */
			var dataTable = $('#filtertable').DataTable({
				"pageLength" : 7,
				'aoColumnDefs' : [ {
					'bSortable' : false,
					'aTargets' : [ 'nosort' ],
				} ],
				columnDefs : [ {
					type : 'date-dd-mm-yyyy',
					aTargets : [ 4 ]
				} ],
				"aoColumns" : [ null, null, null, null, null, null ],

				"order" : false,
				"bLengthChange" : false,
				"dom" : '<"top">ct<"top"p><"clear">'
			});

			/* else {
				table = $('#filtertable).DataTable( {
			        paging: false
			    } );
			} */
			$("#filterbox").keyup(function() {
				dataTable.search(this.value).draw();
			});
		});
		function setIdDelete(id) {
			document.getElementById("idDelete").value = id;
		};
		
		function setValue(id, title, type, author, price) {
			/* console.log("Hàm được gọi", name); */
			document.getElementById("id").value = id;
			document.getElementById("title").value = title;
			document.getElementById("type").value = type;
			document.getElementById("author").value = author;
			document.getElementById("price").value = price;
		};
		
	</script>
</body>
</html>