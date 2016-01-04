<%@page import="ChartDirector.*" %>
<%
// Sample data for the Box-Whisker chart. Represents the minimum, 1st quartile, medium, 3rd quartile
// and maximum values of some quantities
double[] Q0Data = {40, 45, 35};
double[] Q1Data = {55, 60, 50};
double[] Q2Data = {62, 70, 60};
double[] Q3Data = {70, 80, 65};
double[] Q4Data = {80, 90, 75};

// The labels for the chart
String[] labels = {"<*img=robot1.png*><*br*>Bipedal Type", "<*img=robot2.png*><*br*>Wolf Type",
    "<*img=robot5.png*><*br*>Bird Type"};

// Create a XYChart object of size 540 x 320 pixels
XYChart c = new XYChart(540, 320);

// swap the x and y axes to create a horizontal box-whisker chart
c.swapXY();

//Set search path to current JSP directory for loading icon images
c.setSearchPath(getServletConfig().getServletContext(), request);

// Set the plotarea at (75, 25) and of size 440 x 270 pixels. Enable both horizontal and vertical
// grids by setting their colors to grey (0xc0c0c0)
c.setPlotArea(75, 25, 440, 270).setGridColor(0xc0c0c0, 0xc0c0c0);

// Add a title to the chart
c.addTitle("           Robot Shooting Accuracy Scores");

// Set the labels on the x axis and the font to Arial Bold
c.xAxis().setLabels(labels).setFontStyle("Arial Bold");

// Disable x axis ticks by setting the length to 0
c.xAxis().setTickLength(0);

// Set the font for the y axis labels to Arial Bold
c.yAxis().setLabelStyle("Arial Bold");

// Add a Box Whisker layer using light blue 0x9999ff as the fill color and blue (0xcc) as the line
// color. Set the line width to 2 pixels
c.addBoxWhiskerLayer2(Q3Data, Q1Data, Q4Data, Q0Data, Q2Data).setLineWidth(2);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='{xLabel}: min/med/max = {min}/{med}/{max}\n Inter-quartile range: {bottom} to {top}'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Horizontal Box-Whisker Chart
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

