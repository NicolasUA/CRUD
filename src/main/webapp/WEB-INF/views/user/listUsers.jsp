<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
  <title>List Of Users</title>

  <link rel="stylesheet" href='<c:url value="/web-resources/css/pure-0.4.2.css"/>'>

  <link rel="stylesheet"
        href='<c:url value="/web-resources/css/font-awesome-4.0.3/css/font-awesome.css"/>'>
  <link rel="stylesheet"
        href='<c:url value="/web-resources/css/jquery-ui-1.10.4.custom.css"/>'>
  <style type="text/css">
    th {
      text-align: left
    }

  </style>
</head>

<body>
<div style="width: 95%; margin: 0 auto;">

  <div id="userDialog" style="display: none;">
    <%@ include file="userForm.jsp"%>
  </div>

  <h1>List Of Users</h1>

  <table>
    <tbody>
      <tr>
        <td>
          <a href="/user/prev" class="pure-button pure-button-primary">
            <i class="fa fa-arrow-left"></i>
          </a>
        </td>
        <td >
          Page ${page}
        </td>
        <td>
          <a href="/user/next" class="pure-button pure-button-primary">
            <i class="fa fa-arrow-right"></i>
          </a>
        </td>
        <td>
          <form action="/user/search" method="get" class="pure-form pure-form-aligned">
            <input name="name" type="text" value="${search}">
            <!--input type="submit" value="Search" class="pure-button pure-button-primary"-->
            <button class="pure-button pure-button-primary" onclick="submit">
              <i class="fa fa-search"></i> Search
            </button>
          </form>
        </td>
        <td>
          <button class="pure-button pure-button-primary" onclick="addUser()">
          <i class="fa fa-plus"></i> Add user
          </button>
        </td>
      </tr>
    </tbody>
  </table>

  <br>
  <table class="pure-table pure-table-bordered pure-table-striped">
    <thead>
    <tr>
      <th width="10%">ID</th>
      <th width="30%">Name</th>
      <th width="10%">Age</th>
      <th width="10%">Admin</th>
      <th width="15%">Date</th>
      <th width="25%"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="user" varStatus="loopCounter">
      <tr>
        <td><c:out value="${loopCounter.count + (page - 1) * 5}" /></td>
        <td><c:out value="${user.name}" /></td>
        <td><c:out value="${user.age}" /></td>
        <td><c:out value="${user.isAdmin}" /></td>
        <td><c:out value="${user.createdDate}" /></td>

        <td>
          <nobr>
            <button onclick="editUser(${user.id});"
                    class="pure-button pure-button-primary">
              <i class="fa fa-pencil"></i> Edit
            </button>

            <a href="delete/${user.id}" class="pure-button pure-button-primary"
               onclick="return confirm('Are you sure you want to delete this user?');">
              <i class="fa fa-times"></i> Delete
            </a>
          </nobr>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<script type="text/javascript"
        src='<c:url value="/web-resources/js/lib/jquery-1.10.2.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/web-resources/js/lib/jquery-ui-1.10.4.custom.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/web-resources/js/lib/jquery.ui.datepicker.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/web-resources/js/js-for-listUsers.js"/>'></script>
</body>
</html> 