<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:url var="actionUrl" value="save" />

<form:form id="userForm" commandName="user" method="post"
           action="${actionUrl }" class="pure-form pure-form-aligned">

  <fieldset>
    <legend></legend>

    <div class="pure-control-group">
      <label for="name">Name</label>
      <form:input path="name" placeholder="user Name" maxlength="25"/>
    </div>
    <div class="pure-control-group">
      <label for="age">Age</label>
      <form:input path="age" placeholder="Age" maxlength="3" />
    </div>
    <div class="pure-control-group">
      <label for="isAdmin">Admin</label>
      <form:checkbox path="isAdmin" placeholder="Admin" />
    </div>
    <div class="pure-control-group">
      <label for="createdDate">Created</label>
      <form:input path="createdDate" placeholder="YYYY-MM-DD" class="datepicker" />
    </div>

    <form:input path="id" type="hidden" />
  </fieldset>
</form:form>