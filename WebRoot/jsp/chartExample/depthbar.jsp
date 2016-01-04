<%@page import="ChartDirector.*" %>
<%
// The data for the bar chart
double[] data0 = {100, 125, 245, 147, 67};
double[] data1 = {85, 156, 179, 211, 123};
double[] data2 = {97, 87, 56, 267, 157};

// The labels for the bar chart
String[] labels = {"Mon", "Tue", "Wed", "Thu", "Fri"};

// Create a XYChart object of size 500 x 320 pixels
XYChart c = new XYChart(500, 320);

// Set the plotarea at (100, 40) and of size 280 x 240 pixels
c.setPlotArea(100, 40, 280, 240);

// Add a legend box at (405, 100)
c.addLegend(405, 100);

// Add a title to the chart
c.addTitle("Weekday Network Load");

// Add a title to the y axis. Draw the title upright (font angle = 0)
c.yAxis().setTitle("Average\nWorkload\n(MBytes\nPer Hour)").setFontAngle(0);

// Set the labels on the x axis
c.xAxis().setLabels(labels);

// Add three bar layers, each representing one data set. The bars are drawn in semi-transparent
// colors.
c.addBarLayer(data0, 0x808080ff, "Server # 1", 5);
c.addBarLayer(data1, 0x80ff0000, "Server # 2", 5);
c.addBarLayer(data2, 0x8000ff00, "Server # 3", 5);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='{dataSetName} on {xLabel}: {value} MBytes/hour'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Depth Bar Chart
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

