<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="utf-8">
<title>Harbor Home</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<style>
.table {
	table-layout: fixed;
}
</style>

<!-- <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">-->
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg text-white navbar-light bg-dark">
			<a class="navbar-brand" href="/">Harbor</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">UserInfo</a>
					</li>
				</ul>
				<div class="nav-item">
					<a type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#myModal">Add a Machine</a>
				</div>

				<div class="nav-item">
					<a class="nav-link pull-right" href="/logout">Logout</a>
				</div>
			</div>
		</nav>
		<div class="container">


			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">


					<div class="modal-content">
						<div class="modal-header text-center">
							<h4 class="modal-title w-100 font-weight-bold">Machine
								details</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">

							<div class="md-form mb-1">
								<label data-error="wrong" data-success="right"
									for="orangeForm-name">Your name</label> <input type="text"
									id="orangeForm-name" class="form-control validate">
							</div>

							<div class="md-form mb-2">
								<label data-error="wrong" data-success="right"
									for="orangeForm-name">Your name</label> <input type="text"
									id="orangeForm-name" class="form-control validate">
							</div>

							<div class="md-form mb-3">
								<label data-error="wrong" data-success="right"
									for="orangeForm-name">Your name</label> <input type="text"
									id="orangeForm-name" class="form-control validate">

							</div>

							<div class="md-form mb-4">
								<label data-error="wrong" data-success="right"
									for="orangeForm-name">Your name</label> <input type="text"
									id="orangeForm-name" class="form-control validate">
							</div>

							<div class="modal-footer d-flex justify-content-center">
								<button class="btn btn-indigo ">Submit</button>
							</div>

						</div>
					</div>
				</div>

			</div>

			<br>
			<h6>Welcome ${name}</h6>
			<br>

			<c:forEach items="${machines}" var="machine">

				<div class="card">
					<div class="card-header">
						<b>Machine Details</b>
					</div>
					<div class="card-body">


						<p>
							<b>Machine Name</b> :${machine.name}
						</p>
						<p>
							<b>User Name</b> :${machine.user}
						</p>
						<%-- <p><b>Machine FQDN</b> ${machine.fqdn}</p> --%>
						<p>
							<b>Machine IP </b> :${machine.ip}
						</p>
						<p>
							<b>Daemonport </b>:${machine.daemonport}
						</p>
						<a type="button" class="btn btn-warning"
							href="/deleteMachine?id=${machine.id}">Delete</a> <a
							type="button" class="btn btn-success"
							href="/getInfo?id=${machine.id}">Get Info</a>




					</div>
				</div>
			</c:forEach>

		</div>
</body>
</html>

