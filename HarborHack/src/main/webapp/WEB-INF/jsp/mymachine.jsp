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
<script>
	$(document)
			.ready(
					function() {
						var mId = $('#hide').text();
						$("#retrieve-resources")
								.click(
										function() {
											var displayResources = $("#display-resources");
											displayResources
													.text("Loading data from JSON source...");
											// sendRequest(){ 
											$(function poll() {
												setTimeout(function(){$.ajax({
																		type : "GET",
																		url : "/getContainers?id="+mId, // Using our resources.json file to serve results
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
																		complete : poll});}, 5000);});});});
</script>
</head>
<body class="col-md-12">
<h1></h1>
<div id="display-resources">
<p>jQuery example using <a href="http://api.jquery.com/jquery.ajax/">jQuery.ajax()</a> to retrieve a list of
JavaScript Training Resources.</p>
</div>
<a href="#" class="btn btn-primary" id="retrieve-resources">Retrieve List</a>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./test.js"></script>
</body>
</html>

<!-- <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">-->
</head>
<body>
	<p id='hide' hidden>${machine.id}</p>

</body>
</html>