<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="template/header.jsp" />
<h1>Price List</h1>
<%
    org.apache.commons.dbcp2.BasicDataSource dataSource = blog.pwned.sqli.samples.ConnectionPoolUtil.getDataSourceStory2();
    java.sql.Connection connection = dataSource.getConnection();
    try {
        if(request.getParameter("q") != null && request.getParameter("q").length() > 0) {
            String sqlQurty = "SELECT * FROM APP561_PRODUCT";
            sqlQurty = sqlQurty + " where APP561_PRODUCT_NAME='" + request.getParameter("q") + "'";

            java.sql.PreparedStatement pstmt = connection.prepareStatement(sqlQurty);
            System.out.println(sqlQurty);

            java.sql.ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                out.println("Price:" + resultSet.getString(3));
            } else {
                out.println("Not found!");
            }
        }
    } catch (Exception e) {
        out.println("Exception occurred: " + e.getMessage());
    } finally {
        connection.close();
    }
%>
<form action="Story2.jsp" method="get">
    <input type="text" name="q" value="" />
    <input type="submit" value="Search" />
</form>
<jsp:include page="template/footer.jsp" />