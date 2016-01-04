<%@page import="ChartDirector.*" %>
<%
// Sample data for the Box-Whisker chart. Represents the minimum, 1st quartile, medium, 3rd quartile
// and maximum values of some quantities
double[] Q0Data = {40, 45, 40, 30, 20, 50, 25, 44};
double[] Q1Data = {55, 60, 50, 40, 38, 60, 51, 60};
double[] Q2Data = {62, 70, 60, 50, 48, 70, 62, 70};
double[] Q3Data = {70, 80, 65, 60, 53, 78, 69, 76};
double[] Q4Data = {80, 90, 75, 70, 60, 85, 80, 84};

// The labels for the chart
String[] labels = {"Group A", "Group B", "Group C", "Group D", "Group E", "Group F", "Group G",
    "Group H"};

// Create a XYChart object of size 550 x 250 pixels
XYChart c = new XYChart(550, 250);

// Set the plotarea at (50, 25) and of size 450 x 200 pixels. Enable both horizontal and vertical
// grids by setting their colors to grey (0xc0c0c0)
c.setPlotArea(50, 25, 450, 200).setGridColor(0xc0c0c0, 0xc0c0c0);

// Add a title to the chart
c.addTitle("Computer Vision Test Scores");

// Set the labels on the x axis and the font to Arial Bold
c.xAxis().setLabels(labels).setFontStyle("Arial Bold");

// Set the font for the y axis labels to Arial Bold
c.yAxis().setLabelStyle("Arial Bold");

// Add a Box Whisker layer using light blue 0x9999ff as the fill color and blue (0xcc) as the line
// color. Set the line width to 2 pixels
c.addBoxWhiskerLayer(Q3Data, Q1Data, Q4Data, Q0Data, Q2Data, 0x9999ff, 0x0000cc).setLineWidth(2);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='{xLabel}: min/med/max = {min}/{med}/{max}\nInter-quartile range: {bottom} to {top}'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Box-Whisker Chart (1)
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

