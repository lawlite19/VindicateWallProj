<%@page import="ChartDirector.*" %>
<%
// The data for the pyramid chart
double[] data = {156, 123, 211, 179};

// The labels for the pyramid chart
String[] labels = {"Funds", "Bonds", "Stocks", "Cash"};

// The semi-transparent colors for the pyramid layers
int[] colors = {0x400000cc, 0x4066aaee, 0x40ffbb00, 0x40ee6622};

// Create a PyramidChart object of size 450 x 400 pixels
PyramidChart c = new PyramidChart(450, 400);

// Set the pyramid center at (220, 180), and width x height to 150 x 300 pixels
c.setPyramidSize(220, 180, 150, 300);

// Set the elevation to 15 degrees and rotation to 75 degrees
c.setViewAngle(15, 75);

// Set the pyramid data and labels
c.setData(data, labels);

// Set the layer colors to the given colors
c.setColors2(Chart.DataColor, colors);

// Leave 1% gaps between layers
c.setLayerGap(0.01);

// Add a legend box at (320, 60), with light grey (eeeeee) background and grey (888888) border. Set
// the top-left and bottom-right corners to rounded corners of 10 pixels radius.
LegendBox legendBox = c.addLegend(320, 60);
legendBox.setBackground(0xeeeeee, 0x888888);
legendBox.setRoundedCorners(10, 0, 10, 0);

// Add labels at the center of the pyramid layers using Arial Bold font. The labels will show the
// percentage of the layers.
c.setCenterLabel("{percent}%", "Arial Bold");

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{label}: US$ {value}M ({percent}%)'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Rotated Pyramid Chart
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

