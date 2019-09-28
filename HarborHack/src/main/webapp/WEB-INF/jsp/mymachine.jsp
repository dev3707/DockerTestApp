<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="utf-8">
<title>My Machine</title>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	$(document)
			.ready(
					function() {
						//var mId = $('#hide').text();
											var displayResources = $("#display-resources");
											displayResources
													.text("Loading data from JSON source...");
											// sendRequest(){ 
											$(function poll() {
												setTimeout(function(){$.ajax({
																		type : "GET",
																		url : "/getContainers?id="+${machine.id}, // Using our resources.json file to serve results
																		success : function(
																				result) {
																			var i = 0;
																			//console.log(result);
																			var output = "<table><thead><tr><th>Name</th><th>Size</th><th>No. of containers</th></thead><tbody>";
																			for ( var i in result) {
																				output += "<tr><td>"
																						+ result[i].Id
																						+ "</td><td>"
																						+ result[i].Size
																						+ "</td><td>"
																						+ result[i].Containers
																						+ "</td></tr>";
																			}
																			output += "</tbody></table>";
																			displayResources
																					.html(output);
																			$("table")
																					.addClass("table");},
																		complete : poll});}, 5000);});}
						);
	
</script>

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
					data-target="#myModal">Pull an Image</a>
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
						<h4 class="modal-title w-100 font-weight-bold">Image Details</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">

						<form action="/pullImage" name="form1" >
							<div class="form-group">
								<label for="text">Image to be pulled(DockerHub)</label> <input type="text"
									class="form-control" name="imageName">
							</div>
							<input type="hidden" name="machineid" value="${machine.id}"/>
							<button type="submit" class="btn btn-default">Submit</button>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
 
var form = $('#form1');
form.submit(function () {
 
$.ajax({
type: GET,
url: form.attr('action'),
data: form.serialize(),
success: function (data) {
var result=data;
$('#result').attr("value",result);
 
}
});
 
return false;
});
</script>

</head>
<body class="col-md-12">
	<p><b>Containers running on machine<b></p>
	<div class="card">
  <div class="card-body">
    <div id="display-resources"></div>
	</div>
</div>
	<a href="#" class="btn btn-primary" id="retrieve-resources">Retrieve
		List</a>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./test.js"></script>
</body>
</html>

<!-- <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">-->
</head>
<body>
	<p id='hide' hidden>${machine.id}</p>

</body>
</html>