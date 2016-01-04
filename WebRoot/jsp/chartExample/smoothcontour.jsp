<%@page import="ChartDirector.*" %>
<%
// The x and y coordinates of the grid
double[] dataX = {-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
double[] dataY = {-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

// The values at the grid points. In this example, we will compute the values using the formula z =
// Sin(x / 2) * Sin(y / 2).
double[] dataZ = new double[dataX.length * dataY.length];
for (int yIndex = 0; yIndex < dataY.length; ++yIndex) {
    double y = dataY[yIndex];
    for (int xIndex = 0; xIndex < dataX.length; ++xIndex) {
        double x = dataX[xIndex];
        dataZ[yIndex * dataX.length + xIndex] = Math.sin(x / 2.0) * Math.sin(y / 2.0);
    }
}

// Create a XYChart object of size 600 x 500 pixels
XYChart c = new XYChart(600, 500);

// Add a title to the chart using 18 points Times New Roman Bold Italic font
c.addTitle("Nano Lattice Twister Field Intensity        ", "Times New Roman Bold Italic", 18);

// Set the plotarea at (75, 40) and of size 400 x 400 pixels. Use semi-transparent black (80000000)
// dotted lines for both horizontal and vertical grid lines
c.setPlotArea(75, 40, 400, 400, -1, -1, -1, c.dashLineColor(0x80000000, Chart.DotLine), -1);

// Set x-axis and y-axis title using 12 points Arial Bold Italic font
c.xAxis().setTitle("Lattice X Direction (nm)", "Arial Bold Italic", 12);
c.yAxis().setTitle("Lattice Y Direction (nm)", "Arial Bold Italic", 12);

// Set x-axis and y-axis labels to use Arial Bold font
c.xAxis().setLabelStyle("Arial Bold");
c.yAxis().setLabelStyle("Arial Bold");

// When auto-scaling, use tick spacing of 40 pixels as a guideline
c.yAxis().setTickDensity(40);
c.xAxis().setTickDensity(40);

// Add a contour layer using the given data
ContourLayer layer = c.addContourLayer(dataX, dataY, dataZ);

// Set the contour color to transparent
layer.setContourColor(Chart.Transparent);

// Move the grid lines in front of the contour layer
c.getPlotArea().moveGridBefore(layer);

// Add a color axis (the legend) in which the left center point is anchored at (495, 240). Set the
// length to 370 pixels and the labels on the right side.
ColorAxis cAxis = layer.setColorAxis(495, 240, Chart.Left, 370, Chart.Right);

// Add a bounding box to the color axis using light grey (eeeeee) as the background and dark grey
// (444444) as the border.
cAxis.setBoundingBox(0xeeeeee, 0x444444);

// Add a title to the color axis using 12 points Arial Bold Italic font
cAxis.setTitle("Twist Pressure (Twist-Volt)", "Arial Bold Italic", 12);

// Set color axis labels to use Arial Bold font
cAxis.setLabelStyle("Arial Bold");

// Use smooth gradient coloring
cAxis.setColorGradient(true);

// Output the chart
String chart1URL = c.makeSession(request, "chart1", Chart.JPG);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Continuous Contour Coloring
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'>
</body>
</html>

