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
    double[] dataX = {-4, -3, -2, -1, 0, 1, 2, 3, 4};
    double[] dataY = {-4, -3, -2, -1, 0, 1, 2, 3, 4};

    // The values at the grid points. In this example, we will compute the values using the formula
    // z = Sin(x * pi / 3) * Sin(y * pi / 3).
    double[] dataZ = new double[dataX.length * dataY.length];
    for (int yIndex = 0; yIndex < dataY.length; ++yIndex) {
        double y = dataY[yIndex];
        for (int xIndex = 0; xIndex < dataX.length; ++xIndex) {
            double x = dataX[xIndex];
            dataZ[yIndex * dataX.length + xIndex] = Math.sin(x * 3.1416 / 3) * Math.sin(y * 3.1416 /
                3);
        }
    }

    // Create a XYChart object of size 360 x 360 pixels
    XYChart c = new XYChart(360, 360);

    // Set the plotarea at (30, 25) and of size 300 x 300 pixels. Use semi-transparent black
    // (c0000000) for both horizontal and vertical grid lines
    c.setPlotArea(30, 25, 300, 300, -1, -1, -1, 0xc0000000, -1);

    // Add a contour layer using the given data
    ContourLayer layer = c.addContourLayer(dataX, dataY, dataZ);

    // Set the x-axis and y-axis scale
    c.xAxis().setLinearScale(-4, 4, 1);
    c.yAxis().setLinearScale(-4, 4, 1);

    if (chartIndex == 0) {
        // Discrete coloring, spline surface interpolation
        c.addTitle("Spline Surface - Discrete Coloring", "Arial Bold Italic", 12);
    } else if (chartIndex == 1) {
        // Discrete coloring, linear surface interpolation
        c.addTitle("Linear Surface - Discrete Coloring", "Arial Bold Italic", 12);
        layer.setSmoothInterpolation(false);
    } else if (chartIndex == 2) {
        // Smooth coloring, spline surface interpolation
        c.addTitle("Spline Surface - Continuous Coloring", "Arial Bold Italic", 12);
        layer.setContourColor(Chart.Transparent);
        layer.colorAxis().setColorGradient(true);
    } else {
        // Discrete coloring, linear surface interpolation
        c.addTitle("Linear Surface - Continuous Coloring", "Arial Bold Italic", 12);
        layer.setSmoothInterpolation(false);
        layer.setContourColor(Chart.Transparent);
        layer.colorAxis().setColorGradient(true);
    }

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
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Contour Interpolation
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart0.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart2.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart3.imageURL)%>'>
</body>
</html>

