<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="template/header.jsp" />
<h1>Price List</h1>
<%
    org.apache.commons.dbcp2.BasicDataSource dataSource = blog.pwned.sqli.samples.ConnectionPoolUtil.getDataSourceStory6();
    java.sql.Connection connection = dataSource.getConnection();
    try {
        if(request.getParameter("q") != null && request.getParameter("q").length() > 0) {
            String sqlQurty = "SELECT * FROM APP444_PRODUCT";
            sqlQurty = sqlQurty + " where APP444_PRODUCT_NAME='" + request.getParameter("q") + "'";

            java.sql.PreparedStatement pstmt = connection.prepareStatement(sqlQurty);
            System.out.println(sqlQurty);

            java.sql.ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                System.out.println("Product Available. Request price through sales@example.com");
                //Send email to support team about inquiry here
            } else {
                System.out.println("Not found!");
            }
            int randomNum = java.util.concurrent.ThreadLocalRandom.current().nextInt(1, 20000 + 1);
            Thread.sleep(randomNum);
            out.println("Support team will contact you shortly...");
        }
    } catch (Exception e) {
        out.println("Exception occurred ");
    } finally {
        connection.close();
    }
%>
<form action="Story6.jsp" method="get">
    <input type="text" name="q" value="" />
    <input type="submit" value="Search" />
</form>
<jsp:include page="template/footer.jsp" />