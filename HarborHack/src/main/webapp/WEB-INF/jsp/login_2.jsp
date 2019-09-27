<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
	<!-- Login Form -->
	<form method="post">
		Name:<input type="text" name="name" /> Password:<input
			type="password" name="password" /> <input type="submit"> <font
			color="red">${message}</font>
	</form>
	
<%@ include file="common/footer.jspf" %>






