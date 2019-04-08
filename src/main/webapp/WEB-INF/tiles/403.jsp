<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div style="padding-top: 200px;" align="center">
	<span class="h1 display-4 text-danger">You are not authorized person to access this.. 
	</span><a href="${pageContext.request.contextPath}/home" class="h1 display-4 text-info"> Go Back</a>
</div>