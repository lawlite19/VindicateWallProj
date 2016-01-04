<%@page import="ChartDirector.*" %>
<%
// The data for the area chart
double[] data = {30, 28, 40, 55, 75, 68, 54, 60, 50, 62, 75, 65, 75, 89, 60, 55, 53, 35, 50, 66, 56,
    48, 52, 65, 62};

// The labels for the area chart
String[] labels = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14",
    "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"};

// Create a XYChart object of size 250 x 250 pixels
XYChart c = new XYChart(250, 250);

// Set the plotarea at (30, 20) and of size 200 x 200 pixels
c.setPlotArea(30, 20, 200, 200);

// Add an area chart layer using the given data
c.addAreaLayer(data);

// Set the labels on the x axis.
c.xAxis().setLabels(labels);

// Display 1 out of 3 labels on the x-axis.
c.xAxis().setLabelStep(3);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='Hour {xLabel}: Traffic {value} GBytes'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Simple Area Chart
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

