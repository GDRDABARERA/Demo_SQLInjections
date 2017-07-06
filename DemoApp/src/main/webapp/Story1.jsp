<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="template/header.jsp" />
<h1>Price List</h1>
<table class="table"><tr scope="row"><td>ID</td><td>Name</td><td>Price</td></tr>
<%
    org.apache.commons.dbcp2.BasicDataSource dataSource = blog.pwned.sqli.samples.ConnectionPoolUtil.getDataSourceStory1();
    java.sql.Connection connection = dataSource.getConnection();
    try {
        String sqlQurty = "SELECT * FROM APP_PRODUCT";
        if(request.getParameter("q") != null && request.getParameter("q").length() > 0) {
            sqlQurty = sqlQurty + " where APP_PROODUCT_NAME='" + request.getParameter("q") + "'";
        }
        java.sql.PreparedStatement pstmt = connection.prepareStatement(sqlQurty);
        System.out.println(sqlQurty);

        java.sql.ResultSet resultSet = pstmt.executeQuery();
        while (resultSet.next()) {
            out.println("<tr scope=\"row\"><td>"+resultSet.getString(1)+"</td><td>"+resultSet.getString(2)+"</td><td>"+resultSet.getString(3)+"</td></tr>");
        }
    } catch (Exception e) {
        out.println("Exception occurred: " + e.getMessage());
    } finally {
        connection.close();
    }
%>
</table>
<form action="Story1.jsp" method="get">
    <input type="text" name="q" value="" />
    <input type="submit" value="Search" />
</form>
<jsp:include page="template/footer.jsp" />