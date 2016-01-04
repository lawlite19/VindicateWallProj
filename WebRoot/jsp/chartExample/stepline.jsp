<%@page import="ChartDirector.*" %>
<%@page import="java.util.*" %>
<%
// The data for the chart
double[] dataY0 = {4, 4.5, 5, 5.25, 5.75, 5.25, 5, 4.5, 4, 3, 2.5, 2.5};
Date[] dataX0 = {new GregorianCalendar(1997, 0, 1).getTime(), new GregorianCalendar(1998, 5, 25
    ).getTime(), new GregorianCalendar(1999, 8, 6).getTime(), new GregorianCalendar(2000, 1, 6
    ).getTime(), new GregorianCalendar(2000, 8, 21).getTime(), new GregorianCalendar(2001, 2, 4
    ).getTime(), new GregorianCalendar(2001, 5, 8).getTime(), new GregorianCalendar(2002, 1, 4
    ).getTime(), new GregorianCalendar(2002, 4, 19).getTime(), new GregorianCalendar(2002, 7, 16
    ).getTime(), new GregorianCalendar(2002, 11, 1).getTime(), new GregorianCalendar(2003, 0, 1
    ).getTime()};

double[] dataY1 = {7, 6.5, 6, 5, 6.5, 7, 6, 5.5, 5, 4, 3.5, 3.5};
Date[] dataX1 = {new GregorianCalendar(1997, 0, 1).getTime(), new GregorianCalendar(1997, 6, 1
    ).getTime(), new GregorianCalendar(1997, 11, 1).getTime(), new GregorianCalendar(1999, 0, 15
    ).getTime(), new GregorianCalendar(1999, 5, 9).getTime(), new GregorianCalendar(2000, 2, 3
    ).getTime(), new GregorianCalendar(2000, 7, 13).getTime(), new GregorianCalendar(2001, 4, 5
    ).getTime(), new GregorianCalendar(2001, 8, 16).getTime(), new GregorianCalendar(2002, 2, 16
    ).getTime(), new GregorianCalendar(2002, 5, 1).getTime(), new GregorianCalendar(2003, 0, 1
    ).getTime()};

// Create a XYChart object of size 500 x 270 pixels, with a pale blue (e0e0ff) background, black
// border, 1 pixel 3D border effect and rounded corners
XYChart c = new XYChart(600, 300, 0xe0e0ff, 0x000000, 1);
c.setRoundedFrame();

// Set the plotarea at (55, 60) and of size 520 x 200 pixels, with white (ffffff) background. Set
// horizontal and vertical grid lines to grey (cccccc).
c.setPlotArea(50, 60, 525, 200, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

// Add a legend box at (55, 32) (top of the chart) with horizontal layout. Use 9pt Arial Bold font.
// Set the background and border color to Transparent.
c.addLegend(55, 32, false, "Arial Bold", 9).setBackground(Chart.Transparent);

// Add a title box to the chart using 15pt Times Bold Italic font. The text is white (ffffff) on a
// deep blue (000088) background, with soft lighting effect from the right side.
c.addTitle("Long Term Interest Rates", "Times New Roman Bold Italic", 15, 0xffffff).setBackground(
    0x000088, -1, Chart.softLighting(Chart.Right));

// Set the y axis label format to display a percentage sign
c.yAxis().setLabelFormat("{value}%");

// Add a red (ff0000) step line layer to the chart and set the line width to 2 pixels
StepLineLayer layer0 = c.addStepLineLayer(dataY0, 0xff0000, "Country AAA");
layer0.setXData(dataX0);
layer0.setLineWidth(2);

// Add a blue (0000ff) step line layer to the chart and set the line width to 2 pixels
StepLineLayer layer1 = c.addStepLineLayer(dataY1, 0x0000ff, "Country BBB");
layer1.setXData(dataX1);
layer1.setLineWidth(2);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='{dataSetName} change to {value}% on {x|mmm dd, yyyy}'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Step Line Chart
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

