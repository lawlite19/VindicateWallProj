<%@page import="ChartDirector.*" %>
<%@page import="java.util.*" %>
<%
// Data points which more unevenly spaced in time
double[] data0Y = {62, 69, 53, 58, 84, 76, 49, 61, 64, 77, 79};
Date[] data0X = {new GregorianCalendar(2007, 0, 1).getTime(), new GregorianCalendar(2007, 0, 2
    ).getTime(), new GregorianCalendar(2007, 0, 5).getTime(), new GregorianCalendar(2007, 0, 7
    ).getTime(), new GregorianCalendar(2007, 0, 10).getTime(), new GregorianCalendar(2007, 0, 14
    ).getTime(), new GregorianCalendar(2007, 0, 17).getTime(), new GregorianCalendar(2007, 0, 18
    ).getTime(), new GregorianCalendar(2007, 0, 19).getTime(), new GregorianCalendar(2007, 0, 20
    ).getTime(), new GregorianCalendar(2007, 0, 21).getTime()};

// Data points which are evenly spaced in a certain time range
double[] data1Y = {36, 25, 28, 38, 20, 30, 27, 35, 65, 60, 40, 73, 62, 90, 75, 72};
Date data1Start = new GregorianCalendar(2007, 0, 1).getTime();
Date data1End = new GregorianCalendar(2007, 0, 16).getTime();

// Data points which are evenly spaced in another time range, in which the spacing is different from
// the above series
double[] data2Y = {25, 15, 30, 23, 32, 55, 45};
Date data2Start = new GregorianCalendar(2007, 0, 9).getTime();
Date data2End = new GregorianCalendar(2007, 0, 21).getTime();

// Create a XYChart object of size 600 x 400 pixels. Use a vertical gradient color from light blue
// (99ccff) to white (ffffff) spanning the top 100 pixels as background. Set border to grey
// (888888). Use rounded corners. Enable soft drop shadow.
XYChart c = new XYChart(600, 400);
c.setBackground(c.linearGradientColor(0, 0, 0, 100, 0x99ccff, 0xffffff), 0x888888);
c.setRoundedFrame();
c.setDropShadow();

// Add a title using 18pt Times New Roman Bold Italic font. Set top margin to 16 pixels.
c.addTitle("Product Line Order Backlog", "Times New Roman Bold Italic", 18).setMargin2(0, 0, 16, 0);

// Set the plotarea at (60, 80) and of 510 x 275 pixels in size. Use transparent border and dark
// grey (444444) dotted grid lines
PlotArea plotArea = c.setPlotArea(60, 80, 510, 275, -1, -1, Chart.Transparent, c.dashLineColor(
    0x444444, 0x0101), -1);

// Add a legend box where the top-center is anchored to the horizontal center of the plot area at y
// = 45. Use horizontal layout and 10 points Arial Bold font, and transparent background and border.
LegendBox legendBox = c.addLegend(plotArea.getLeftX() + plotArea.getWidth() / 2, 45, false,
    "Arial Bold", 10);
legendBox.setAlignment(Chart.TopCenter);
legendBox.setBackground(Chart.Transparent, Chart.Transparent);

// Set x-axis tick density to 75 pixels and y-axis tick density to 30 pixels. ChartDirector
// auto-scaling will use this as the guidelines when putting ticks on the x-axis and y-axis.
c.yAxis().setTickDensity(30);
c.xAxis().setTickDensity(75);

// Set all axes to transparent
c.xAxis().setColors(Chart.Transparent);
c.yAxis().setColors(Chart.Transparent);

// Set the x-axis margins to 15 pixels, so that the horizontal grid lines can extend beyond the
// leftmost and rightmost vertical grid lines
c.xAxis().setMargin(15, 15);

// Set axis label style to 8pt Arial Bold
c.xAxis().setLabelStyle("Arial Bold", 8);
c.yAxis().setLabelStyle("Arial Bold", 8);
c.yAxis2().setLabelStyle("Arial Bold", 8);

// Add axis title using 10pt Arial Bold Italic font
c.yAxis().setTitle("Backlog in USD millions", "Arial Bold Italic", 10);

// Add the first data series
LineLayer layer0 = c.addLineLayer2();
layer0.addDataSet(data0Y, 0xff0000, "Quantum Computer").setDataSymbol(Chart.GlassSphere2Shape, 11);
layer0.setXData(data0X);
layer0.setLineWidth(3);

// Add the second data series
LineLayer layer1 = c.addLineLayer2();
layer1.addDataSet(data1Y, 0x00ff00, "Atom Synthesizer").setDataSymbol(Chart.GlassSphere2Shape, 11);
layer1.setXData2(data1Start, data1End);
layer1.setLineWidth(3);

// Add the third data series
LineLayer layer2 = c.addLineLayer2();
layer2.addDataSet(data2Y, 0xff6600, "Proton Cannon").setDataSymbol(Chart.GlassSphere2Shape, 11);
layer2.setXData2(data2Start, data2End);
layer2.setLineWidth(3);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='Backlog of {dataSetName} at {x|mm/dd/yyyy}: US$ {value}M'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Uneven Data Points 
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

