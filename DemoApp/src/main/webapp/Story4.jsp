<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="template/header.jsp" />
<h1>Price List</h1>
<%
    org.apache.commons.dbcp2.BasicDataSource dataSource = blog.pwned.sqli.samples.ConnectionPoolUtil.getDataSourceStory4();
    java.sql.Connection connection = dataSource.getConnection();
    try {
        if(request.getParameter("q") != null && request.getParameter("q").length() > 0) {
            String sqlQurty = "SELECT * FROM APP245_PRODUCT";
            sqlQurty = sqlQurty + " where APP245_PRODUCT_NAME='" + request.getParameter("q") + "'";

            java.sql.PreparedStatement pstmt = connection.prepareStatement(sqlQurty);
            System.out.println(sqlQurty);

            java.sql.ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                out.println("Product Available. Request price through sales@example.com");
            } else {
                out.println("Not found!");
            }
        }
    } catch (Exception e) {
        out.println("Exception occurred ");
    } finally {
        connection.close();
    }
%>
<form action="Story4.jsp" method="get">
    <input type="text" name="q" value="" />
    <input type="submit" value="Search" />
</form>
<jsp:include page="template/footer.jsp" />