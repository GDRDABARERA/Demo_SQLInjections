<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="template/header.jsp" />
<h1>Price List</h1>
<%
    org.apache.commons.dbcp2.BasicDataSource dataSource = blog.pwned.sqli.samples.ConnectionPoolUtil.getDataSourceStory5();
    java.sql.Connection connection = dataSource.getConnection();
    try {
        if(request.getParameter("q") != null && request.getParameter("q").length() > 0) {
            String sqlQurty = "SELECT * FROM APP084_PRODUCT";
            sqlQurty = sqlQurty + " where APP084_PRODUCT_NAME='" + request.getParameter("q") + "'";

            java.sql.PreparedStatement pstmt = connection.prepareStatement(sqlQurty);
            System.out.println(sqlQurty);

            java.sql.ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                System.out.println("Product Available. Request price through sales@example.com");
                //Send email to support team about inquiry here
            } else {
                System.out.println("Not found!");
            }
            out.println("Support team will contact you shortly...");
        }
    } catch (Exception e) {
        out.println("Exception occurred ");
    } finally {
        connection.close();
    }
%>
<form action="Story5.jsp" method="get">
    <input type="text" name="q" value="" />
    <input type="submit" value="Search" />
</form>
<jsp:include page="template/footer.jsp" />