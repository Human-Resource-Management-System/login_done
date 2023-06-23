
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.nkxgen.spring.orm.model.Employee" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Page</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Custom CSS -->
  <style>
    /* Add your custom CSS styles here */
    .profile-picture {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #f2f2f2;
      color: #666666;
      font-size: 48px;
      font-weight: bold;
      text-transform: uppercase;
    }
    
  </style>
</head>
<body>
            <form action= "update_address" method="POST" >


<%

   System.out.println("its end of java in jsp"); 
   Employee empdet = (Employee) request.getAttribute("empdet");

%>


  <!-- Profile section -->
 <div class="col-md-4">
  <div class="d-flex justify-content-center">
  
 <% String imagePath = request.getContextPath() + "/"; %>
  
    <div class="profile-picture">
      <img src="<%=imagePath+empdet.getEmpl_photo()%>" alt="profile-picture" height="200px" width="200px">
    </div>
  </div>
</div>

      <div class="col-md-8">
        <div class="card">
          <div class="card-header">
           
          </div>
          <div class="card-body">
           <div class="form-group col-md-6">
            
             <div class="form-row" style="display: none;">	
              <div class="form-group col-md-6">
   			 <label for="empl_jondate">employee ID</label>
    		<input type="text" class="form-control" id="empl_id" name="empl_id" value="${empdet.getEmpl_id()}" readonly>
 		 </div>
				</div>

                  <label for="empl_frstname">First Name</label>
                  <% System.out.println("employee last_name   "+empdet.getEmpl_frstname()); %>
                  <input type="text" class="form-control" id="empl_frstname" value= "${ empdet.getEmpl_frstname()}" readonly>
                </div>
                <div class="form-group col-md-6">
                  <label for="empl_lastname">Last Name</label>
                  <input type="text" class="form-control" id="empl_lastname" value="${empdet.getEmpl_lastname()}" readonly>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="empl_jbgr_id">Job Group ID</label>
                  <input type="text" class="form-control" id="empl_jbgr_id" value="${empdet.getEmpl_jbgr_id()}" readonly>
                </div>
                <div class="form-group col-md-6">
                  <label for="empl_jondate">Joining Date</label>
                  <input type="text" class="form-control" id="empl_jondate" value="${empdet.getEmpl_jondate()}" readonly>
                </div>
              </div>
              
             
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="empl_dob">Date of Birth</label>
                  <input type="text" class="form-control" id="empl_dob" value="${empdet. getEmpl_dob()}" readonly>
                </div>
                <div class="form-group col-md-6">
                  <label for="empl_designation">Designation</label>
                  <input type="text" class="form-control" id="empl_designation" value="${empdet.getEmpl_designation()}" readonly>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="empl_offemail">Official Email</label>
                  <input type="text" class="form-control" id="empl_offemail" value="${empdet.getEmpl_offemail()}" readonly>
                </div>
                <div class="form-group col-md-6">
                  <label for="empl_pemail">Personal Email</label>
                  <input type="text" class="form-control" id="empl_pemail" value="${empdet.getEmpl_pemail()}" readonly>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="empl_mobile">Mobile</label>
                  <input type="text" class="form-control" id="empl_mobile" value="${empdet.getEmpl_mobile()}" readonly>
                </div>
                <div class="form-group col-md-6">
                  <label for="empl_alemail">Alternate Email</label>
                  <input type="text" class="form-control" id="empl_alemail" value="${empdet.getEmpl_altemail()}" readonly>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="empl_bloodgroup">Blood Group</label>
                  <input type="text" class="form-control" id="empl_bloodgroup" value="${empdet.getEmpl_bloodgroup()}" readonly>
                </div>
                <div class="form-group col-md-6">
                  <label for="empl_gender">Gender</label>
                  <input type="text" class="form-control" id="empl_gender" value="${empdet.getEmpl_gender()}" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="empl_address">Address</label>
                <input type="text" class="form-control" id="empl_address" name ="empl_address" value="${empdet.getEmpl_address()}">
              </div>
              <div class="form-group">
                <label for="empl_fname">Father's Name</label>
                <input type="text" class="form-control" id="empl_fname" value="${empdet.getEmpl_fname()}" readonly>
              </div>
              <div class="form-group">
                <label for="empl_luudate">Last Updated Date</label>
                <input type="text" class="form-control" id="empl_luudate" value="${empdet.getEmpl_luudate()}" readonly>
              </div>
              <div class="form-group">
                <label for="empl_luuser">Last Updated User</label>
                <input type="text" class="form-control" id="empl_luuser" value="${empdet.getEmpl_luuser()}" readonly>
               <%  System.out.println(empdet.getEmpl_luuser());%>
              </div>
              <button type="submit" class="btn btn-primary">Save Address</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
  
  

  <!-- Bootstrap JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>