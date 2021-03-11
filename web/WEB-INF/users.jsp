<%-- 
    Document   : users
    Created on : Mar 10, 2021, 9:01:04 AM
    Author     : 468181
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Week 8 Lab</title>
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    </head>

    <body>


       <h1 class="ManageUsers">Manage Users</h1>

        <table style="width:50%">
            <tr>
                <th>Email</th>
                <th>First Name</th>
                <th>Last name</th>
                <th>Role </th>
                <th>Edit </th>
                <th>Delete</th>
            </tr>

            <c:forEach var="user" items="${users}">
             
                <tr>
                <td>${user.email}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.password}</td>
                <td> <form method="POST" action="user">
                        <input type="hidden" name="action" value="edit">
                        <input type="submit" value="edit">
                        <input type="hidden" name="email" value="${user.email}">
                    </form>
                 
                </td>
                <td>
                    
                    <form method="POST" action="user">
                        <input type="hidden" name=action value="delete">
                        <input type="submit" value="delete">
                        <input type="hidden" name="email" value="${user.email}">
                    </form>
                
                </td>
                <td>Delete</td>
                </tr>
            
        </c:forEach>
        </table>
        <c:if test="${selectedUser == null}"> 
        <h1 class="adduser">Add Users</h1>
        <form action="addusers" method="POST">
            <input type="email" class="details" name="email" placeholder="Email">
            <input type="text" class="details" name="fname" placeholder="First Name">
            <input type="text" class="details" name="lname" placeholder="Last Name">
            <input type="password" class="details" name="password" placeholder="Password">

            <select name="domain" class="details">
                <option value="Company Admin">Company Admin</option>
                <option value="System Admin">System Admin</option>
                <option value="Regular Admin">Regular Admin</option>

            </select>

            <input type="submit" value="Save" class="save">
        </form>
        </c:if>


        <c:if test="${selectedUser != null}">
        <h1 class="edituser">Edit Users</h1>
        
            <form action="edituser" method="post">
            <input type="email" class="details" name="email" value=${selectedUser.email}>
            <input type="text" class="details" name="fname" value=${selectedUser.fname}>
            <input type="text" class="details" name="lname" value=${selectedUser.lanme}>
            <input type="password" class="details" name="password" value=${selectedUser.password}>
            <input type="submit" value="Save">
            <input type="hidden" name="action" value="save">
            <input type="submit" value="Cancel">
            <input type="hidden" name="action" value="cancel">
        </c:if>

            <!-- if/else what user company they edit
      
        
      <-->



            </body>
            </html>
