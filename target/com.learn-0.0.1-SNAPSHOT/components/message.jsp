
<%
	String successMsg = (String) session.getAttribute("message");
	String errorMsg = (String) session.getAttribute("err-message");

	if (successMsg != null) {
		// prints
%>
<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	<strong><%=successMsg%></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<%
	session.removeAttribute("message");

	} else if (errorMsg != null) {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
	<strong><%=errorMsg%></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<%
	session.removeAttribute("err-message");
	}
%>