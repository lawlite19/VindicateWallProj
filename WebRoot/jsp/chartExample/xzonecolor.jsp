<%@page import="ChartDirector.*" %>
<%@page import="java.util.*" %>
<%
// The data for the chart
double[] data = {50, 55, 47, 34, 42, 49, 63, 62, 73, 59, 56, 50, 64, 60, 67, 67, 58, 59, 73, 77, 84,
    82, 80, 84, 89};

// The error data representing the error band around the data points
double[] errData = {5, 6, 5.1, 6.5, 6.6, 8, 5.4, 5.1, 4.6, 5.0, 5.2, 6.0, 4.9, 5.6, 4.8, 6.2, 7.4,
    7.1, 6.5, 9.6, 12.1, 15.3, 18.5, 20.9, 24.1};

// The timestamps for the data
Date[] labels = {new GregorianCalendar(2001, 0, 1).getTime(), new GregorianCalendar(2001, 1, 1
    ).getTime(), new GregorianCalendar(2001, 2, 1).getTime(), new GregorianCalendar(2001, 3, 1
    ).getTime(), new GregorianCalendar(2001, 4, 1).getTime(), new GregorianCalendar(2001, 5, 1
    ).getTime(), new GregorianCalendar(2001, 6, 1).getTime(), new GregorianCalendar(2001, 7, 1
    ).getTime(), new GregorianCalendar(2001, 8, 1).getTime(), new GregorianCalendar(2001, 9, 1
    ).getTime(), new GregorianCalendar(2001, 10, 1).getTime(), new GregorianCalendar(2001, 11, 1
    ).getTime(), new GregorianCalendar(2002, 0, 1).getTime(), new GregorianCalendar(2002, 1, 1
    ).getTime(), new GregorianCalendar(2002, 2, 1).getTime(), new GregorianCalendar(2002, 3, 1
    ).getTime(), new GregorianCalendar(2002, 4, 1).getTime(), new GregorianCalendar(2002, 5, 1
    ).getTime(), new GregorianCalendar(2002, 6, 1).getTime(), new GregorianCalendar(2002, 7, 1
    ).getTime(), new GregorianCalendar(2002, 8, 1).getTime(), new GregorianCalendar(2002, 9, 1
    ).getTime(), new GregorianCalendar(2002, 10, 1).getTime(), new GregorianCalendar(2002, 11, 1
    ).getTime(), new GregorianCalendar(2003, 0, 1).getTime()};

// Create a XYChart object of size 550 x 220 pixels
XYChart c = new XYChart(550, 220);

// Set the plot area at (50, 10) and of size 480 x 180 pixels. Enabled both vertical and horizontal
// grids by setting their colors to light grey (cccccc)
c.setPlotArea(50, 10, 480, 180).setGridColor(0xcccccc, 0xcccccc);

// Add a legend box (50, 10) (top of plot area) using horizontal layout. Use 8pt Arial font. Disable
// bounding box (set border to transparent).
LegendBox legendBox = c.addLegend(50, 10, false, "", 8);
legendBox.setBackground(Chart.Transparent);

// Add keys to the legend box to explain the color zones
legendBox.addKey("Historical", 0x9999ff);
legendBox.addKey("Forecast", 0xff9966);

// Add a title to the y axis.
c.yAxis().setTitle("Energy Consumption");

// Set the labels on the x axis
c.xAxis().setLabels2(labels);

// Set multi-style axis label formatting. Use Arial Bold font for yearly labels and display them as
// "yyyy". Use default font for monthly labels and display them as "mmm". Replace some labels with
// minor ticks to ensure the labels are at least 3 units apart.
c.xAxis().setMultiFormat(Chart.StartOfYearFilter(), "<*font=Arial Bold*>{value|yyyy}",
    Chart.StartOfMonthFilter(), "{value|mmm}", 3);

// Add a line layer to the chart
LineLayer layer = c.addLineLayer2();

// Create the color to draw the data line. The line is blue (0x333399) to the left of x = 18, and
// become a red (0xd04040) dash line to the right of x = 18.
int lineColor = layer.xZoneColor(18, 0x333399, c.dashLineColor(0xd04040, Chart.DashLine));

// Add the data line
layer.addDataSet(data, lineColor, "Average");

// We are not showing the data set name in the legend box. The name is for showing in tool tips
// only.
layer.setLegend(Chart.NoLegend);

// Create the color to draw the err zone. The color is semi-transparent blue (0x809999ff) to the
// left of x = 18, and become semi-transparent red (0x80ff9966) to the right of x = 18.
int errColor = layer.xZoneColor(18, 0x809999ff, 0x80ff9966);

// Add the upper border of the err zone
layer.addDataSet(new ArrayMath(data).add(errData).result(), errColor, "Upper bound");

// Add the lower border of the err zone
layer.addDataSet(new ArrayMath(data).sub(errData).result(), errColor, "Lower bound");

// Set the default line width to 2 pixels
layer.setLineWidth(2);

// In this example, we are not showing the data set name in the legend box
layer.setLegend(Chart.NoLegend);

// Color the region between the err zone lines
c.addInterLineLayer(layer.getLine(1), layer.getLine(2), errColor);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart.
String imageMap1 = c.getHTMLImageMap("", "",
    "title='{dataSetName} on {xLabel|mmm yyyy}: {value} MJoule'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    X Zone Coloring
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

