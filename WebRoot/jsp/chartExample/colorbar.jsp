<%@page import="ChartDirector.*" %>
<%
// The data for the bar chart
double[] data = {85, 156, 179, 211, 123, 189, 166};

// The labels for the bar chart
String[] labels = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"};

// The colors for the bars
int[] colors = {0x5588bb, 0x66bbbb, 0xaa6644, 0x99bb55, 0xee9944, 0x444466, 0xbb5555};

// Create a XYChart object of size 600 x 400 pixels
XYChart c = new XYChart(600, 400);

// Add a title box using grey (0x555555) 24pt Arial font
c.addTitle("Multi-Color Bar Chart", "Arial", 24, 0x555555);

// Set the plotarea at (70, 60) and of size 500 x 300 pixels, with transparent background and border
// and light grey (0xcccccc) horizontal grid lines
c.setPlotArea(70, 60, 500, 300, Chart.Transparent, -1, Chart.Transparent, 0xcccccc);

// Set the x and y axis stems to transparent and the label font to 12pt Arial
c.xAxis().setColors(Chart.Transparent);
c.yAxis().setColors(Chart.Transparent);
c.xAxis().setLabelStyle("Arial", 12);
c.yAxis().setLabelStyle("Arial", 12);

// Add a multi-color bar chart layer with transparent border using the given data
c.addBarLayer3(data, colors).setBorderColor(Chart.Transparent);

// Set the labels on the x axis.
c.xAxis().setLabels(labels);

// For the automatic y-axis labels, set the minimum spacing to 40 pixels.
c.yAxis().setTickDensity(40);

// Add a title to the y axis using dark grey (0x555555) 14pt Arial font
c.yAxis().setTitle("Y-Axis Title Placeholder", "Arial", 14, 0x555555);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{xLabel}: ${value}M'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Multi-Color Bar Chart (1)
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

