<%@page import="ChartDirector.*" %>
<%@page import="java.util.*" %>
<%

// The x coordinates for the 2 scatter groups
Date[] dataX = {new GregorianCalendar(2011, 8, 1).getTime(), new GregorianCalendar(2011, 8, 2
    ).getTime(), new GregorianCalendar(2011, 8, 3).getTime(), new GregorianCalendar(2011, 8, 4
    ).getTime(), new GregorianCalendar(2011, 8, 5).getTime(), new GregorianCalendar(2011, 8, 6
    ).getTime(), new GregorianCalendar(2011, 8, 7).getTime(), new GregorianCalendar(2011, 8, 8
    ).getTime(), new GregorianCalendar(2011, 8, 9).getTime(), new GregorianCalendar(2011, 8, 10
    ).getTime(), new GregorianCalendar(2011, 8, 11).getTime()};

// The y and z coordinates for the first scatter group
double[] dataY0 = {0.4, 0.2, 0.5, 0.4, 0.7, 1.3, 1.1, 1.0, 0.6, 0.4, 0.5};
double[] dataZ0 = {43, 38, 33, 23.4, 28, 36, 34, 47, 53, 45, 40};

// The y and z coordinates for the second scatter group
double[] dataY1 = {1.4, 1.0, 1.8, 1.9, 1.5, 1.0, 0.6, 0.7, 1.2, 1.7, 1.5};
double[] dataZ1 = {46, 41, 33, 37, 28, 29, 34, 37, 41, 52, 50};

// Instead of displaying numeric values, labels are used for the y-axis
String[] labelsY = {"Low", "Medium", "High"};

// Create a ThreeDScatterChart object of size 760 x 520 pixels
ThreeDScatterChart c = new ThreeDScatterChart(760, 520);

// Add a title to the chart using 18 points Arial font
c.addTitle("3D Scatter Chart Axis Types", "Arial", 18);

// Set the center of the plot region at (385, 270), and set width x depth x height to 480 x 240 x
// 240 pixels
c.setPlotRegion(385, 270, 480, 240, 240);

// Set the elevation and rotation angles to 30 and -10 degrees
c.setViewAngle(30, -10);

// Add a legend box at (380, 40) with horizontal layout. Use 9pt Arial Bold font.
LegendBox b = c.addLegend(380, 40, false, "Arial Bold", 9);
b.setAlignment(Chart.TopCenter);
b.setRoundedCorners();

// Add a scatter group to the chart using 13 pixels red (ff0000) glass sphere symbols, with dotted
// drop lines
ThreeDScatterGroup g0 = c.addScatterGroup(Chart.CTime(dataX), dataY0, dataZ0, "Alpha Series",
    Chart.GlassSphere2Shape, 13, 0xff0000);
g0.setDropLine(c.dashLineColor(Chart.SameAsMainColor, Chart.DotLine));

// Add a scatter group to the chart using 13 pixels blue (00cc00) cross symbols, with dotted drop
// lines
ThreeDScatterGroup g1 = c.addScatterGroup(Chart.CTime(dataX), dataY1, dataZ1, "Beta Series",
    Chart.Cross2Shape(), 13, 0x00cc00);
g1.setDropLine(c.dashLineColor(Chart.SameAsMainColor, Chart.DotLine));

// Set x-axis tick density to 50 pixels. ChartDirector auto-scaling will use this as the guideline
// when putting ticks on the x-axis.
c.xAxis().setTickDensity(50);

// Set the y-axis labels
c.yAxis().setLabels(labelsY);

// Set label style to Arial bold for all axes
c.xAxis().setLabelStyle("Arial Bold");
c.yAxis().setLabelStyle("Arial Bold");
c.zAxis().setLabelStyle("Arial Bold");

// Set the x, y and z axis titles using deep blue (000088) 15 points Arial font
c.xAxis().setTitle("Date/Time Axis", "Arial Italic", 15, 0x000088);
c.yAxis().setTitle("Label\nBased\nAxis", "Arial Italic", 15, 0x000088);
c.zAxis().setTitle("Numeric Axis", "Arial Italic", 15, 0x000088);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    3D Scatter Axis Types
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'>
</body>
</html>

