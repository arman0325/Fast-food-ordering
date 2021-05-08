<!DOCTYPE html>
<html>
    <head>
        <title>Add Food</title>
        <link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
        <script src="<c:url value="/assets/js/bootstrap.bundle.min.js" />"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main class="container">
            <div class="py-5 px-3 mt-5">
                <h2>Add New Food</h2>
                <form:form method="POST" enctype="multipart/form-data"
                           modelAttribute="foodForm">
                    <form:label path="foodName">Food Name</form:label><br />
                    <form:input type="text" path="foodName" required="required"/><br /><br />
                    <form:label path="description">Description</form:label><br />
                    <form:textarea path="description" rows="5" cols="30" required="required"/><br /><br />
                    <form:label path="price">Price</form:label><br />
                    <form:input type="number" step="0.1" path="price" min="0" required="required"/><br /><br />
                    <form:radiobutton path="availability"  value="true" />Available
                    <form:radiobutton path="availability"  value="false" />Not Available
                    <br /><br />
                    <b>Attachments</b><br />
                    <input type="file" name="attachments" multiple="multiple" accept="image/*"/><br /><br />
                    <input type="submit" value="Submit"/>
                </form:form>
            </div>
        </main>
    </body>
</html>
