<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <%--  <div class="col-md-6">
            <p>User: ${loginedUser.id}  ${loginedUser.username}</p>
            <p>Current Date : <%= new java.util.Date() %> </p>
        </div>  
        <div class="col-md-1" >
        
            <button class="btn-basic" id="lgnout-button"><a href="logOut">Logout</a></button>
       
        </div>  --%>
<!DOCTYPE html>
<html lang="en">

<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="<c:url value="/resources/css/test.css" />" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    
        <title>frame</title>
</head>

<body>
    <div id="testheader">
        <div class="container">
            <div class=row>        
                <div class="col-md-5 ">
            <a href="home"><h3>Student Registration</h3></a>
        </div>  
        <div class="col-md-6">
            <p>User: ${loginedUser.id}  ${loginedUser.username} ${loginedUser.role}</p>
            <p>Current Date : <%= new java.util.Date() %> </p>
        </div>  
        <div class="col-md-1" >
        
            <button class="btn-basic" id="lgnout-button"><a href="/Student/logOut">Logout</a></button>
       
        </div>   
    </div>
</div>

</div>
    <!-- <div id="testsidebar">Hello World </div> -->
    <div class="sidenav">
        
        <button class="dropdown-btn" > Class Management <i class="fa fa-caret-down"></i></button>
        
            <div class="dropdown-container">
          <a href="/Student/preAddCourse">Course Registration </a>
         
          	<a href="/Student/StudentRegistration">Student Registration </a>
        
          <a href="/Student/SearchStudent">Student Search </a>
      
       	 </div>
       	 	 <c:if test="${loginedUser.role=='Admin'}">
     		   <a href="USR001.html">Users Management</a>
     		 </c:if>
    	 </div>
  
						<!-- main contects -->
  <%-- <jsp:include page="NewFile.jsp"></jsp:include> --%>


    
        <div id="testfooter">
            <span>Copyright &#169; ACE Inspiration 2022</span>
        </div>
        <script>
            /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
            var dropdown = document.getElementsByClassName("dropdown-btn");
            var i;
            
            for (i = 0; i < dropdown.length; i++) {
              dropdown[i].addEventListener("click", function() {
              this.classList.toggle("active");
              var dropdownContent = this.nextElementSibling;
              if (dropdownContent.style.display === "block") {
              dropdownContent.style.display = "none";
              } else {
              dropdownContent.style.display = "block";
              }
              });
            }
            </script>
</body>

</html>


      
        
        