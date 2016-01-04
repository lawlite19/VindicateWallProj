<%@page import="ChartDirector.*" %>
<%
// The data for the pyramid chart
double[] data = {156, 123, 211, 179};

// The labels for the pyramid chart
String[] labels = {"Funds", "Bonds", "Stocks", "Cash"};

// The semi-transparent colors for the pyramid layers
int[] colors = {0x60000088, 0x6066aaee, 0x60ffbb00, 0x60ee6622};

// Create a PyramidChart object of size 480 x 400 pixels
PyramidChart c = new PyramidChart(480, 400);

// Set the cone center at (280, 180), and width x height to 150 x 300 pixels
c.setConeSize(280, 180, 150, 300);

// Set the elevation to 15 degrees
c.setViewAngle(15);

// Set the pyramid data and labels
c.setData(data, labels);

// Set the layer colors to the given colors
c.setColors2(Chart.DataColor, colors);

// Leave 1% gaps between layers
c.setLayerGap(0.01);

// Add labels at the left side of the pyramid layers using Arial Bold font. The labels will have 3
// lines showing the layer name, value and percentage.
c.setLeftLabel("{label}\nUS ${value}K\n({percent}%)", "Arial Bold");

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{label}: US$ {value}K ({percent}%)'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Cone Chart
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

