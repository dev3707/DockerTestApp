<%@ include file="common/header.jspf" %>
<nav role="navigation" class="navbar navbar-default">
	    <div class="">
	        <a href="http://www.in28minutes.com" class="navbar-brand">in28Minutes</a>
	    </div>
	    <div class="navbar-collapse" id="navdiv">
	        <ul class="nav navbar-nav" >
	            <li class="active"><a  href="/">Home</a></li>
	            <li ><a href="/list-todos" title="todo">Todos</a></li>
	        </ul>
	         <ul class="nav navbar-right">
	            <li><a href="/logout">Logout</a></li>
	        </ul>
	    </div>
	</nav>
<h2>Welcome ${name} </h2><a href="/list-machines" >Click Here</a> to manage your todos.</body>
<%@ include file="common/footer.jspf" %>
