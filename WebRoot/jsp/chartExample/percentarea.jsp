<%@page import="ChartDirector.*" %>
<%@page import="java.util.*" %>
<%
// The data for the area chart
double[] data0 = {42, 49, 33, 38, 51, 46, 29, 41, 44, 57, 59, 52, 37, 34, 51, 56, 56, 60, 70, 76,
    63, 67, 75, 64, 51};
double[] data1 = {50, 55, 47, 34, 42, 49, 63, 62, 73, 59, 56, 50, 64, 60, 67, 67, 58, 59, 73, 77,
    84, 82, 80, 84, 98};
double[] data2 = {87, 89, 85, 66, 53, 39, 24, 21, 37, 56, 37, 23, 21, 33, 13, 17, 14, 23, 16, 25,
    29, 30, 45, 47, 46};

// The timestamps on the x-axis
Date[] labels = {new GregorianCalendar(1996, 0, 1).getTime(), new GregorianCalendar(1996, 3, 1
    ).getTime(), new GregorianCalendar(1996, 6, 1).getTime(), new GregorianCalendar(1996, 9, 1
    ).getTime(), new GregorianCalendar(1997, 0, 1).getTime(), new GregorianCalendar(1997, 3, 1
    ).getTime(), new GregorianCalendar(1997, 6, 1).getTime(), new GregorianCalendar(1997, 9, 1
    ).getTime(), new GregorianCalendar(1998, 0, 1).getTime(), new GregorianCalendar(1998, 3, 1
    ).getTime(), new GregorianCalendar(1998, 6, 1).getTime(), new GregorianCalendar(1998, 9, 1
    ).getTime(), new GregorianCalendar(1999, 0, 1).getTime(), new GregorianCalendar(1999, 3, 1
    ).getTime(), new GregorianCalendar(1999, 6, 1).getTime(), new GregorianCalendar(1999, 9, 1
    ).getTime(), new GregorianCalendar(2000, 0, 1).getTime(), new GregorianCalendar(2000, 3, 1
    ).getTime(), new GregorianCalendar(2000, 6, 1).getTime(), new GregorianCalendar(2000, 9, 1
    ).getTime(), new GregorianCalendar(2001, 0, 1).getTime(), new GregorianCalendar(2001, 3, 1
    ).getTime(), new GregorianCalendar(2001, 6, 1).getTime(), new GregorianCalendar(2001, 9, 1
    ).getTime(), new GregorianCalendar(2002, 0, 1).getTime()};

// Create a XYChart object of size 500 x 280 pixels, using 0xffffcc as background color, with a
// black border, and 1 pixel 3D border effect
XYChart c = new XYChart(500, 280, 0xffffcc, 0, 1);

//Set search path to current JSP directory for loading icon images
c.setSearchPath(getServletConfig().getServletContext(), request);

// Set the plotarea at (50, 45) and of size 320 x 200 pixels with white background. Enable
// horizontal and vertical grid lines using the grey (0xc0c0c0) color.
c.setPlotArea(50, 45, 320, 200, 0xffffff).setGridColor(0xc0c0c0, 0xc0c0c0);

// Add a legend box at (370, 45) using vertical layout and 8 points Arial Bold font.
LegendBox legendBox = c.addLegend(370, 45, true, "Arial Bold", 8);

// Set the legend box background and border to transparent
legendBox.setBackground(Chart.Transparent, Chart.Transparent);

// Set the legend box icon size to 16 x 32 pixels to match with custom icon size
legendBox.setKeySize(16, 32);

// Add a title to the chart using 14 points Times Bold Itatic font and white font color, and
// 0x804020 as the background color
c.addTitle("Quarterly Product Sales", "Times New Roman Bold Italic", 14, 0xffffff).setBackground(
    0x804020);

// Set the labels on the x axis.
c.xAxis().setLabels2(labels);

// Set multi-style axis label formatting. Start of year labels are displayed as yyyy. For other
// labels, just show minor tick.
c.xAxis().setMultiFormat(Chart.StartOfYearFilter(), "{value|yyyy}", Chart.AllPassFilter(), "-");

// Add a percentage area layer to the chart
AreaLayer layer = c.addAreaLayer2(Chart.Percentage);

// Add the three data sets to the area layer, using icons images with labels as data set names
layer.addDataSet(data0, 0x40ddaa77, "<*block,valign=absmiddle*><*img=service.png*> Service<*/*>");
layer.addDataSet(data1, 0x40aadd77, "<*block,valign=absmiddle*><*img=software.png*> Software<*/*>");
layer.addDataSet(data2, 0x40aa77dd, "<*block,valign=absmiddle*><*img=computer.png*> Hardware<*/*>");

// For a vertical stacked chart with positive data only, the last data set is always on top.
// However, in a vertical legend box, the last data set is at the bottom. This can be reversed by
// using the setLegend method.
layer.setLegend(Chart.ReverseLegend);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='{dataSetName} sales at {xLabel|yyyy} Q{=({xLabel|m}+2)/3|0}: US${value}K ({percent}%)'")
    ;
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Percentage Area Chart
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

