<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row text-center"><strong> User Details</strong></div>
<div>
<div>
    <form action="/logout" method="post">
        <button type="submit" class="btn btn-danger">Log Out</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
<div class="row" style="border:1px solid green;padding:10px">
    <div class="h1 col-md-4 text-center"><strong>Name</strong></div>
    <div class="col-md-4 text-center"><strong>Password</strong></div>
    <div class="col-md-4 text-center"><strong>Authority</strong></div>
</div>
<%--<c:forEach var="user" items="${users}">
    <div class="row" style="border:1px solid green;padding:10px">
        <div class="col-md-4 text-center"></div>
        <div class="col-md-4 text-center" ></div>
        <div class="col-md-4 text-center"></div>
    </div>
</c:forEach>--%>
</div>