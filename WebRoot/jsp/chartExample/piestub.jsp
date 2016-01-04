<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Simple Clickable Pie Chart Handler
</div>
<hr style="border:solid 1px #000080" />
<div style="font-size:10pt; font-family:verdana; margin-bottom:20px">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<div style="font-size:10pt; font-family:verdana;">
<b>You have clicked on the following sector :</b><br />
<ul>
    <li>Sector Number : <%=request.getParameter("sector")%></li>
    <li>Sector Name : <%=request.getParameter("label")%></li>
    <li>Sector Value : <%=request.getParameter("value")%></li>
    <li>Sector Percentage : <%=request.getParameter("percent")%>%</li>
</ul>
</div>
</body>
</html>
