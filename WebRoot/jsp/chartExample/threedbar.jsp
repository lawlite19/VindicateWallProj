<%@page import="ChartDirector.*" %>
<%
// The data for the bar chart
double[] data = {85, 156, 179.5, 211, 123};

// The labels for the bar chart
String[] labels = {"Mon", "Tue", "Wed", "Thu", "Fri"};

// Create a XYChart object of size 300 x 280 pixels
XYChart c = new XYChart(300, 280);

// Set the plotarea at (45, 30) and of size 200 x 200 pixels
c.setPlotArea(45, 30, 200, 200);

// Add a title to the chart
c.addTitle("Weekly Server Load");

// Add a title to the y axis
c.yAxis().setTitle("MBytes");

// Add a title to the x axis
c.xAxis().setTitle("Work Week 25");

// Add a bar chart layer with green (0x00ff00) bars using the given data
c.addBarLayer(data, 0x00ff00).set3D();

// Set the labels on the x axis.
c.xAxis().setLabels(labels);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{xLabel}: {value} MBytes'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    3D Bar Chart
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

