<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="template/header.jsp" />
<style>
.im {
    font-size: 2em;
}
</style>
<h1>Storyline</h1>
<ul>
    <li><a target="_blank" href="Story1.jsp">Story 1</a><br/><br/><pre>User can search "product price list" and display results in a table.</pre></li>
    <li><a target="_blank" href="Story2.jsp">Story 2</a><br/><br/><pre>No more tables. User can only see price of a single item. <span class="im">&#x1F606</span></pre></li>
    <li><a target="_blank" href="Story3.jsp">Story 3</a><br/><br/><pre>No more data from database. If product is present user has to call support for the price. <span class="im">&#x1F621</span></pre></li>
    <li><a target="_blank" href="Story4.jsp">Story 4</a><br/><br/><pre>No more data from database AND NO EXCEPTION DETAILS! <span class="im">&#x1F608</span></pre></li>
    <li><a target="_blank" href="Story5.jsp">Story 5</a><br/><br/><pre>User gets a common message. Support team will contact the customer. <span class="im">&#x1F62D</span></pre></li>
    <li><a target="_blank" href="Story6.jsp">Story 6</a><br/><br/><pre>RANDOM delay before common message. (%@$&#^!#^%)</pre></li>
</ul>
<jsp:include page="template/footer.jsp" />