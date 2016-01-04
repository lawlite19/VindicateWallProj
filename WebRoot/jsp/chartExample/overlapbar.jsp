<%@page import="ChartDirector.*" %>
<%
// The data for the bar chart
double[] data0 = {100, 125, 156, 147, 87, 124, 178, 109, 140, 106, 192, 122};
double[] data1 = {122, 156, 179, 211, 198, 177, 160, 220, 190, 188, 220, 270};
double[] data2 = {167, 190, 213, 267, 250, 320, 212, 199, 245, 267, 240, 310};
String[] labels = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov",
    "Dec"};

// Create a XYChart object of size 580 x 280 pixels
XYChart c = new XYChart(580, 280);

// Add a title to the chart using 14pt Arial Bold Italic font
c.addTitle("Product Revenue For Last 3 Years", "Arial Bold Italic", 14);

// Set the plot area at (50, 50) and of size 500 x 200. Use two alternative background colors
// (f8f8f8 and ffffff)
c.setPlotArea(50, 50, 500, 200, 0xf8f8f8, 0xffffff);

// Add a legend box at (50, 25) using horizontal layout. Use 8pt Arial as font, with transparent
// background.
c.addLegend(50, 25, false, "Arial", 8).setBackground(Chart.Transparent);

// Set the x axis labels
c.xAxis().setLabels(labels);

// Draw the ticks between label positions (instead of at label positions)
c.xAxis().setTickOffset(0.5);

// Add a multi-bar layer with 3 data sets
BarLayer layer = c.addBarLayer2(Chart.Side);
layer.addDataSet(data0, 0xff8080, "Year 2003");
layer.addDataSet(data1, 0x80ff80, "Year 2004");
layer.addDataSet(data2, 0x8080ff, "Year 2005");

// Set 50% overlap between bars
layer.setOverlapRatio(0.5);

// Add a title to the y-axis
c.yAxis().setTitle("Revenue (USD in millions)");

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='{xLabel} Revenue on {dataSetName}: {value} millions'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Overlapping Bar Chart
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

