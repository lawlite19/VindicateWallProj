<%@page import="ChartDirector.*" %>
<%
// The data for the area chart
double[] data = {30, 28, 40, 55, 75, 68, 54, 60, 50, 62, 75, 65, 75, 89, 60, 55, 53, 35, 50, 66, 56,
    48, 52, 65, 62};

// The labels for the area chart
double[] labels = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
    23, 24};

// Create a XYChart object of size 320 x 320 pixels
XYChart c = new XYChart(320, 320);

// Swap the x and y axis to become a rotated chart
c.swapXY();

// Set the y axis on the top side (right + rotated = top)
c.setYAxisOnRight();

// Reverse the x axis so it is pointing downwards
c.xAxis().setReverse();

// Set the plotarea at (50, 50) and of size 200 x 200 pixels. Enable horizontal and vertical grids
// by setting their colors to grey (0xc0c0c0).
c.setPlotArea(50, 50, 250, 250).setGridColor(0xc0c0c0, 0xc0c0c0);

// Add a line chart layer using the given data
c.addAreaLayer(data, c.gradientColor(50, 0, 300, 0, 0xffffff, 0x0000ff));

// Set the labels on the x axis. Append "m" after the value to show the unit.
c.xAxis().setLabels2(labels, "{value} m");

// Display 1 out of 3 labels.
c.xAxis().setLabelStep(3);

// Add a title to the x axis
c.xAxis().setTitle("Depth");

// Add a title to the y axis
c.yAxis().setTitle("Carbon Dioxide Concentration (ppm)");

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='Carbon dioxide concentration at {xLabel}: {value} ppm'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Rotated Area Chart
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

