<%@page import="ChartDirector.*" %>
<%
// The XY data of the first data series
double[] dataX = {50, 55, 37, 24, 42, 49, 63, 72, 83, 59};
double[] dataY = {3.6, 2.8, 2.5, 2.3, 3.8, 3.0, 3.8, 5.0, 6.0, 3.3};

// Create a XYChart object of size 450 x 420 pixels
XYChart c = new XYChart(450, 420);

// Set the plotarea at (55, 65) and of size 350 x 300 pixels, with white background and a light grey
// border (0xc0c0c0). Turn on both horizontal and vertical grid lines with light grey color
// (0xc0c0c0)
c.setPlotArea(55, 65, 350, 300, 0xffffff, -1, 0xc0c0c0, 0xc0c0c0, -1);

// Add a title to the chart using 18 point Times Bold Itatic font.
c.addTitle("Server Performance", "Times New Roman Bold Italic", 18);

// Add titles to the axes using 12pt Arial Bold Italic font
c.yAxis().setTitle("Response Time (sec)", "Arial Bold Italic", 12);
c.xAxis().setTitle("Server Load (TPS)", "Arial Bold Italic", 12);

// Set the axes line width to 3 pixels
c.yAxis().setWidth(3);
c.xAxis().setWidth(3);

// Add a scatter layer using (dataX, dataY)
ScatterLayer scatterLayer = c.addScatterLayer(dataX, dataY, "", Chart.DiamondSymbol, 11, 0x008000);

// tool tip for scatter layer
scatterLayer.setHTMLImageMap("", "", "title='Response time at {x} TPS: {value} sec'");

// Add a trend line layer for (dataX, dataY)
TrendLayer trendLayer = c.addTrendLayer2(dataX, dataY, 0x008000);

// Set the line width to 3 pixels
trendLayer.setLineWidth(3);

// Add a 95% confidence band for the line
trendLayer.addConfidenceBand(0.95, 0x806666ff);

// Add a 95% confidence band (prediction band) for the points
trendLayer.addPredictionBand(0.95, 0x8066ff66);

// tool tip for trend layer
trendLayer.setHTMLImageMap("", "",
    "title='Slope = {slope|4} sec/TPS; Intercept = {intercept|4} sec'");

// Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 10pt Arial Bold
// Italic font. Set the background and border color to Transparent.
LegendBox legendBox = c.addLegend(50, 30, false, "Arial Bold Italic", 10);
legendBox.setBackground(Chart.Transparent);

// Add entries to the legend box
legendBox.addKey("95% Line Confidence", 0x806666ff);
legendBox.addKey("95% Point Confidence", 0x8066ff66);

// Display the trend line parameters as a text table formatted using CDML
TextBox textbox = c.addText(56, 65, java.text.MessageFormat.format(
    "<*block*>Slope\nIntercept\nCorrelation\nStd Error<*/*>   <*block*>{0,number,#.####} " +
    "sec/tps\n{1,number,#.####} sec\n{2,number,#.####}\n{3,number,#.####} sec<*/*>", new Object[]{
    new Double(trendLayer.getSlope()), new Double(trendLayer.getIntercept()), new Double(
    trendLayer.getCorrelation()), new Double(trendLayer.getStdError())}), "Arial Bold", 8);

// Set the background of the text box to light grey, with a black border, and 1 pixel 3D border
textbox.setBackground(0xc0c0c0, 0, 1);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Confidence Band
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

