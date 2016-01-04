<%@page import="ChartDirector.*" %>
<%
// The data for the pie chart
double[] data = {72, 18, 15, 12};

// The labels for the pie chart
String[] labels = {"Labor", "Machinery", "Facilities", "Computers"};

// The depths for the sectors
double[] depths = {30, 20, 10, 10};

// Create a PieChart object of size 360 x 300 pixels, with a light blue (DDDDFF) background and a 1
// pixel 3D border
PieChart c = new PieChart(360, 300, 0xddddff, -1, 1);

// Set the center of the pie at (180, 175) and the radius to 100 pixels
c.setPieSize(180, 175, 100);

// Add a title box using 15pt Times Bold Italic font and blue (AAAAFF) as background color
c.addTitle("Project Cost Breakdown", "Times New Roman Bold Italic", 15).setBackground(0xaaaaff);

// Set the pie data and the pie labels
c.setData(data, labels);

// Draw the pie in 3D with variable 3D depths
c.set3D2(depths);

// Set the start angle to 225 degrees may improve layout when the depths of the sector are sorted in
// descending order, because it ensures the tallest sector is at the back.
c.setStartAngle(225);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{label}: US${value}K ({percent}%)'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Multi-Depth Pie Chart
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'
    usemap="#map1" border="0">
<map name="map1"><%=imageMap1%></map>
</body>
</html>

