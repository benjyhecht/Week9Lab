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
        </table>

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



        
        <h1 class="edituser">Edit Users</h1>
        <c:if test="${selectedUser == true}">
            <p>You have successfully logged out.</p>
        </c:if>
        <form action="edituser" method="post">
            <input type="email" class="details" name="email" value=${users.email}>
            <input type="text" class="details" name="fname" value=${users.fname}>
            <input type="text" class="details" name="lname" value=${users.lanme}>
            <input type="password" class="details" name="password" value=${users.password}> 

            <!-- if/else what user company they edit
      
        
      <-->



            </body>
            </html>
