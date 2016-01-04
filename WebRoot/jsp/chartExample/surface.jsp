<%@page import="ChartDirector.*" %>
<%
// The x and y coordinates of the grid
double[] dataX = {-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
double[] dataY = {-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

// The values at the grid points. In this example, we will compute the values using the formula z =
// x * sin(y) + y * sin(x).
double[] dataZ = new double[dataX.length * dataY.length];
for (int yIndex = 0; yIndex < dataY.length; ++yIndex) {
    double y = dataY[yIndex];
    for (int xIndex = 0; xIndex < dataX.length; ++xIndex) {
        double x = dataX[xIndex];
        dataZ[yIndex * dataX.length + xIndex] = x * Math.sin(y) + y * Math.sin(x);
    }
}

// Create a SurfaceChart object of size 720 x 600 pixels
SurfaceChart c = new SurfaceChart(720, 600);

// Add a title to the chart using 20 points Times New Roman Italic font
c.addTitle("Surface Energy Density   ", "Times New Roman Italic", 20);

// Set the center of the plot region at (350, 280), and set width x depth x height to 360 x 360 x
// 270 pixels
c.setPlotRegion(350, 280, 360, 360, 270);

// Set the data to use to plot the chart
c.setData(dataX, dataY, dataZ);

// Spline interpolate data to a 80 x 80 grid for a smooth surface
c.setInterpolation(80, 80);

// Add a color axis (the legend) in which the left center is anchored at (645, 270). Set the length
// to 200 pixels and the labels on the right side.
c.setColorAxis(645, 270, Chart.Left, 200, Chart.Right);

// Set the x, y and z axis titles using 10 points Arial Bold font
c.xAxis().setTitle("X (nm)", "Arial Bold", 10);
c.yAxis().setTitle("Y (nm)", "Arial Bold", 10);
c.zAxis().setTitle("Energy Density (J/m<*font,super*>2<*/font*>)", "Arial Bold", 10);

// Output the chart
String chart1URL = c.makeSession(request, "chart1", Chart.JPG);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Surface Chart (1)
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'>
</body>
</html>

