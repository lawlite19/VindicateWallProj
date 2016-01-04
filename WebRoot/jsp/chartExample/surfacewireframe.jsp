<%@page import="ChartDirector.*" %>
<%@page import="javax.servlet.http.*" %>
<%!
// A simple structure to represent a chart image with an image map
private static class ImageWithHotSpot
{
    String imageURL;
    String imageMap;
}

// Function to create the demo charts
ImageWithHotSpot createChart(HttpServletRequest request, int chartIndex)
{
    // The x and y coordinates of the grid
    double[] dataX = {-2, -1, 0, 1, 2};
    double[] dataY = {-2, -1, 0, 1, 2};

    // The values at the grid points. In this example, we will compute the values using the formula
    // z = square_root(15 - x * x - y * y).
    double[] dataZ = new double[dataX.length * dataY.length];
    for (int yIndex = 0; yIndex < dataY.length; ++yIndex) {
        double y = dataY[yIndex];
        for (int xIndex = 0; xIndex < dataX.length; ++xIndex) {
            double x = dataX[xIndex];
            dataZ[yIndex * dataX.length + xIndex] = Math.sqrt(15 - x * x - y * y);
        }
    }

    // Create a SurfaceChart object of size 380 x 340 pixels, with white (ffffff) background and
    // grey (888888) border.
    SurfaceChart c = new SurfaceChart(380, 340, 0xffffff, 0x888888);

    // Demonstrate various wireframes with and without interpolation
    if (chartIndex == 0) {
        // Original data without interpolation
        c.addTitle("5 x 5 Data Points\nStandard Shading", "Arial Bold", 12);
        c.setContourColor(0x80ffffff);
    } else if (chartIndex == 1) {
        // Original data, spline interpolated to 40 x 40 for smoothness
        c.addTitle("5 x 5 Points - Spline Fitted to 40 x 40\nStandard Shading", "Arial Bold", 12);
        c.setContourColor(0x80ffffff);
        c.setInterpolation(40, 40);
    } else if (chartIndex == 2) {
        // Rectangular wireframe of original data
        c.addTitle("5 x 5 Data Points\nRectangular Wireframe");
        c.setShadingMode(Chart.RectangularFrame);
    } else if (chartIndex == 3) {
        // Rectangular wireframe of original data spline interpolated to 40 x 40
        c.addTitle("5 x 5 Points - Spline Fitted to 40 x 40\nRectangular Wireframe");
        c.setShadingMode(Chart.RectangularFrame);
        c.setInterpolation(40, 40);
    } else if (chartIndex == 4) {
        // Triangular wireframe of original data
        c.addTitle("5 x 5 Data Points\nTriangular Wireframe");
        c.setShadingMode(Chart.TriangularFrame);
    } else {
        // Triangular wireframe of original data spline interpolated to 40 x 40
        c.addTitle("5 x 5 Points - Spline Fitted to 40 x 40\nTriangular Wireframe");
        c.setShadingMode(Chart.TriangularFrame);
        c.setInterpolation(40, 40);
    }

    // Set the center of the plot region at (200, 170), and set width x depth x height to 200 x 200
    // x 150 pixels
    c.setPlotRegion(200, 170, 200, 200, 150);

    // Set the plot region wall thichness to 5 pixels
    c.setWallThickness(5);

    // Set the elevation and rotation angles to 20 and 30 degrees
    c.setViewAngle(20, 30);

    // Set the data to use to plot the chart
    c.setData(dataX, dataY, dataZ);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart" + chartIndex, Chart.JPG);
    return ret;
}
%>
<%
ImageWithHotSpot chart0 = createChart(request, 0);
ImageWithHotSpot chart1 = createChart(request, 1);
ImageWithHotSpot chart2 = createChart(request, 2);
ImageWithHotSpot chart3 = createChart(request, 3);
ImageWithHotSpot chart4 = createChart(request, 4);
ImageWithHotSpot chart5 = createChart(request, 5);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Surface Wireframe
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart0.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart2.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart3.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart4.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart5.imageURL)%>'>
</body>
</html>

