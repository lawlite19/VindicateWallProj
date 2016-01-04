<%@page import="ChartDirector.*" %>
<%
// The data for the chart
double[] data = {90, 60, 65, 75, 40};

// The labels for the chart
String[] labels = {"Speed", "Reliability", "Comfort", "Safety", "Efficiency"};

// Create a PolarChart object of size 450 x 350 pixels
PolarChart c = new PolarChart(450, 350);

// Set center of plot area at (225, 185) with radius 150 pixels
c.setPlotArea(225, 185, 150);

// Add an area layer to the polar chart
c.addAreaLayer(data, 0x9999ff);

// Set the labels to the angular axis as spokes
c.angularAxis().setLabels(labels);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{label}: score = {value}'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Simple Radar Chart
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

