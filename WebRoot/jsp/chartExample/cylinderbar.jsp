<%@page import="ChartDirector.*" %>
<%
// The data for the bar chart
double[] data = {85, 156, 179.5, 211, 123};

// The labels for the bar chart
String[] labels = {"Mon", "Tue", "Wed", "Thu", "Fri"};

// Create a XYChart object of size 400 x 240 pixels.
XYChart c = new XYChart(400, 240);

// Add a title to the chart using 14pt Times Bold Italic font
c.addTitle("Weekly Server Load", "Times New Roman Bold Italic", 14);

// Set the plotarea at (45, 40) and of 300 x 160 pixels in size. Use alternating light grey (f8f8f8)
// / white (ffffff) background.
c.setPlotArea(45, 40, 300, 160, 0xf8f8f8, 0xffffff);

// Add a multi-color bar chart layer
BarLayer layer = c.addBarLayer3(data);

// Set layer to 3D with 10 pixels 3D depth
layer.set3D(10);

// Set bar shape to circular (cylinder)
layer.setBarShape(Chart.CircleShape);

// Set the labels on the x axis.
c.xAxis().setLabels(labels);

// Add a title to the y axis
c.yAxis().setTitle("MBytes");

// Add a title to the x axis
c.xAxis().setTitle("Work Week 25");

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{xLabel}: {value} MBytes'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Cylinder Bar Shape
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

