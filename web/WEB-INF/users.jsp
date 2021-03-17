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
                    <td>${user.role.roleName}</td>
                    <td>
                        <form method="POST" action="user">
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
                </tr>

            </c:forEach>
        </table>
        <c:if test="${selectedUser == null}"> 
            <h1 class="adduser">Add Users</h1>
            <form action="user" method="POST">
                <input type="email" class="details" name="email" placeholder="Email">
                <input type="text" class="details" name="fname" placeholder="First Name">
                <input type="text" class="details" name="lname" placeholder="Last Name">
                <input type="password" class="details" name="password" placeholder="Password">

                <select name="domain" class="details">
                    <c:forEach var="roleChoice" items="${roles}">
                        <option value="${roleChoice.roleId}">${roleChoice.roleName}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="add">
                <input type="hidden" value="add" name="action">
            </form>
            <form>
                <input type="submit" value="cancel">
                <input type="hidden" value="cancel" name="action">
            </form>
        </c:if>


        <c:if test="${selectedUser != null}">
            <h1 class="edituser">Edit Users</h1>

        <tr><form action="user" method="post">
            <input type="hidden" class="details" name="email" value=${selectedUser.email}>
            <td><input type="text" class="details" name="fname" value=${selectedUser.firstName}></td>
            <td><input type="text" class="details" name="lname" value=${selectedUser.lastName}></td>
            <td><input type="password" class="details" name="password" value=${selectedUser.password}></td>
            <td><select name="domain" class="details" selected="${selectedUser.role.roleName}">
                    <c:forEach var="roleChoice" items="${roles}">
                        <option value="${roleChoice.roleId}">${roleChoice.roleName}</option>
                    </c:forEach>
                </select> </td>
            <td><input type="submit" value="save">
                <input type="hidden" name="action" value="save"></td>

        </form>
        <form action="user" method="post">
            <td><input type="submit" value="cancel">
                <input type="hidden" name="action" value="cancel"></td>
        </form>
    </tr>
</c:if>

<br> ${message}

</body>
</html>
