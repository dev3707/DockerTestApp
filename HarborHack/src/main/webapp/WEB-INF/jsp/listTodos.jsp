<%@ include file="common/header.jspf" %>
<nav role="navigation" class="navbar navbar-default">
	    <div class="">
	        <a href="http://www.in28minutes.com" class="navbar-brand">in28Minutes</a>
	    </div>
	    <div class="navbar-collapse" id="navdiv">
	        <ul class="nav navbar-nav" >
	            <li><a  href="/">Home</a></li>
	            <li class="active"><a  href="/list-todos" title="todo">Todos</a></li>
	        </ul>
	         <ul class="nav navbar-right">
	            <li><a href="/logout">Logout</a></li>
	        </ul>
	    </div>
	</nav>
<div class="container">
	<table class="table table-striped">
		<caption>Your todos are</caption>
		<thead>
			<tr>
				<th>Description</th>
				<th>Target Date</th>
				<th>Is it Done?</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${todos}" var="todo">
				<tr>
					<td>${todo.desc}</td>
					<td><fmt:formatDate value="${todo.targetDate}"
							pattern="dd/MM/yyyy" /></td>
					<td>${todo.done}</td>
					<td><a type="button" class="btn btn-warning"
						href="/deleteTodo?id=${todo.id}">Delete</a></td>
					<td><a type="button" class="btn btn-success"
						href="/updateTodo?id=${todo.id}">Update</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<a type="button" class="btn btn-primary" href="/addTodo">Add a
			Todo</a>
	</div>
</div>
<%@ include file="common/footer.jspf" %>
