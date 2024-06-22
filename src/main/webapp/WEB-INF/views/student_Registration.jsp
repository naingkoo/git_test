<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
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
    
        <title>Top Menu MNU001</title>
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

 <div class="main_contents">
    <div id="sub_content">
        <form:form action="/Student/addStudent" method="post" modelAttribute="student">

            <h2 class="col-md-6 offset-md-2 mb-5 mt-4">Student Registration</h2>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <form:label path="id" class="col-md-2 col-form-label">Student ID</form:label>
                <div class="col-md-4">
                     <form:input type="text" class="form-control" path="id" disabled="disabled"/>
                    
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                 <form:label path="id" class="col-md-2 col-form-label">Name</form:label>
                <div class="col-md-4">
                    <form:input type="text" class="form-control" path="name"/>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
               <form:label path="dob" class="col-md-2 col-form-label">DOB</form:label>
                <div class="col-md-4">
                    <input type="date" class="form-control" path="dob">
                </div>
            </div>
            <fieldset class="row mb-4">
                <div class="col-md-2"></div>
                <legend class="col-form-label col-md-2 pt-0">Gender</legend>
                <div class="col-md-4">
                   <!--  <div class="form-check-inline">
                        <input class="form-check-input" type="radio"  name="gridRadios" id="gridRadios1" value="option1"
                            checked>
                        <label class="form-check-label" for="gridRadios1">
                            Male
                        </label>
                    </div> -->
                        <form:radiobuttons path="gender" items="${genders}" class="form-check-input" itemValue="key" itemLabel="value"/>
                </div>
            
            </fieldset>
    
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <form:label path="phone" class="col-md-2 col-form-label">Phone</form:label>
                <div class="col-md-4">
                    <form:input type="text" class="form-control" path="phone" />
                </div>
            </div>
            <div class="row mb-4">
   				 <div class="col-md-2"></div>
    			<label for="education" class="col-md-2 col-form-label">Education</label>
    			<div class="col-md-4">
     		   <form:select path="education" multiple="false" class="form-control">
      		     <form:options items="${education}" />
                    </form:select>
   				 </div>
			</div>
            <fieldset class="row mb-4">
                <div class="col-md-2"></div>
                <legend class="col-form-label col-md-2 pt-0">Attend</legend>
    
                <div class="col-md-4">
               
                
                    <div class="form-check-inline col-md-2">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios1" value="option1">
                        <label class="form-check-label" for="gridRadios1">
                            PFC
                        </label>
                    </div>
                     <c:forEach var="course1" items="${allcourses}">
                        <div class="form-check">
                            <form:checkbox path="course" value="${course1.id}" class="form-check-input"/>
                            <form:label path="course" class="form-check-label">${course1.course_name}</form:label>
                        </div>
                        <c:if test="${status.index % 5 == 0}">
                            <div class="w-100"></div>
                        </c:if>
                    </c:forEach>
                <!--     <div class="form-check-inline col-md-2">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
                        <label class="form-check-label" for="gridRadios2">
                            JWD
                        </label>
                    </div>
                    <div class="form-check-inline col-md-2">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
                        <label class="form-check-label" for="gridRadios2">
                            PHP
                        </label>
                    </div>
                    <div class="form-check-inline col-md-2">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios1" value="option1">
                        <label class="form-check-label" for="gridRadios1">
                            OJT
                        </label>
                    </div> 
    
    
                </div>
    
                <div class="col-md-6 offset-md-4 mt-4">
                    <div class="form-check-inline col-md-2">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios1" value="option1">
                        <label class="form-check-label" for="gridRadios1">
                            ASP.Net
                        </label>
                    </div>
    
                    <div class="form-check-inline col-md-2">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
                        <label class="form-check-label" for="gridRadios2">
                            Python
                        </label>
                    </div>
                    <div class="form-check-inline col-md-2">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
                        <label class="form-check-label" for="gridRadios2">
                            Android
                        </label>
                    </div>
    
                </div>
                <div class="col-md-6 offset-md-4 mt-4">
                    <div class="form-check-inline col-md-2">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios1" value="option1">
                        <label class="form-check-label" for="gridRadios1">
                            Python
                        </label>
                    </div>
    
                    <div class="form-check-inline col-md-2">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
                        <label class="form-check-label" for="gridRadios2">
                            JavaScript
                        </label>
                    </div>
                    <div class="form-check-inline col-md-3">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
                        <label class="form-check-label" for="gridRadios2">
                            React Native
                        </label>
                    </div>-->
    
                </div>
            </fieldset>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="name" class="col-md-2 col-form-label">Photo</label>
                <div class="col-md-4">
                    <input type="file" class="form-control" id="name">
                </div>
            </div>
    
            <div class="row mb-4">
                <div class="col-md-4"></div>
    
                <div class="col-md-4">
                    <button type="button" class="btn btn-danger ">
    
                        Reset
                    </button>
                    <button type="submit" class="btn btn-secondary col-md-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add
                    </button>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Student Registration</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h5 style="color: rgb(127, 209, 131);">${addStudentMsg}</h5>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success col-md-2" data-bs-dismiss="modal">Ok</button>
                               
                            </div>
                        </div>
                    </div>
            </div>
                </div>

    
            </div>
    
    
    
    
    
            </form:form>
    </div>
</div>

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
