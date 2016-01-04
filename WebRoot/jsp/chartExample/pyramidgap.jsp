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
    // The data for the pyramid chart
    double[] data = {156, 123, 211, 179};

    // The colors for the pyramid layers
    int[] colors = {0x66aaee, 0xeebb22, 0xcccccc, 0xcc88ff};

    // The layer gap
    double gap = chartIndex * 0.01;

    // Create a PyramidChart object of size 200 x 200 pixels, with white (ffffff) background and
    // grey (888888) border
    PyramidChart c = new PyramidChart(200, 200, 0xffffff, 0x888888);

    // Set the pyramid center at (100, 100), and width x height to 60 x 120 pixels
    c.setPyramidSize(100, 100, 60, 120);

    // Set the layer gap
    c.addTitle("Gap = " + gap, "Arial Italic", 15);
    c.setLayerGap(gap);

    // Set the elevation to 15 degrees
    c.setViewAngle(15);

    // Set the pyramid data
    c.setData(data);

    // Set the layer colors to the given colors
    c.setColors2(Chart.DataColor, colors);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart" + chartIndex);
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
    Pyramid Gap
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

