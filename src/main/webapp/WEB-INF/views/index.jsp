<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="<c:url value="/resources/css/test.css" />" rel="stylesheet">
<title> Student Registration LGN001 </title>
</head>
<body class="login-page-body"> 
  
    <div class="login-page">
      <div class="form">
        <div class="login">
          <div class="login-header">
            <h1>Welcome!</h1>
            <p>${login_error }</p>
          </div>
        </div>
        <form:form class="login-form" action="loginSubmit" method="post" modelAttribute="login">
          <form:errors path="username" cssClass='text-danger'/>
          <form:input type="text" placeholder="User ID" path="username"/>
          <form:errors path="password" cssClass="error"/>
          <form:input type="password" placeholder="Password" path="password"/>
          
          <button>login</button>
          <p class="message">Not registered? <a href="#">Create an account</a></p>
        </form:form>
      </div>
    </div>
   
</body>
</html>