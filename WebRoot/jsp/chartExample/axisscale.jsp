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
    // The data for the chart
    double[] data = {5.5, 3.5, -3.7, 1.7, -1.4, 3.3};
    String[] labels = {"Jan", "Feb", "Mar", "Apr", "May", "Jun"};

    // Create a XYChart object of size 200 x 190 pixels
    XYChart c = new XYChart(200, 190);

    // Set the plot area at (30, 20) and of size 140 x 140 pixels
    c.setPlotArea(30, 20, 140, 140);

    // Configure the axis as according to the input parameter
    if (chartIndex == 0) {
        c.addTitle("No Axis Extension", "Arial", 8);
    } else if (chartIndex == 1) {
        c.addTitle("Top/Bottom Extensions = 0/0", "Arial", 8);
        // Reserve 20% margin at top of plot area when auto-scaling
        c.yAxis().setAutoScale(0, 0);
    } else if (chartIndex == 2) {
        c.addTitle("Top/Bottom Extensions = 0.2/0.2", "Arial", 8);
        // Reserve 20% margin at top and bottom of plot area when auto-scaling
        c.yAxis().setAutoScale(0.2, 0.2);
    } else if (chartIndex == 3) {
        c.addTitle("Axis Top Margin = 15", "Arial", 8);
        // Reserve 15 pixels at top of plot area
        c.yAxis().setMargin(15);
    } else {
        c.addTitle("Manual Scale -5 to 10", "Arial", 8);
        // Set the y axis to scale from -5 to 10, with ticks every 5 units
        c.yAxis().setLinearScale(-5, 10, 5);
    }

    // Set the labels on the x axis
    c.xAxis().setLabels(labels);

    // Add a color bar layer using the given data. Use a 1 pixel 3D border for the bars.
    c.addBarLayer3(data).setBorderColor(-1, 1);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart" + chartIndex);

    // Include tool tip for the chart
    ret.imageMap = c.getHTMLImageMap("", "", "title='ROI for {xLabel}: {value}%'");

    return ret;
}
%>
<%
ImageWithHotSpot chart0 = createChart(request, 0);
ImageWithHotSpot chart1 = createChart(request, 1);
ImageWithHotSpot chart2 = createChart(request, 2);
ImageWithHotSpot chart3 = createChart(request, 3);
ImageWithHotSpot chart4 = createChart(request, 4);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Y-Axis Scaling
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart0.imageURL)%>'
    usemap="#map0" border="0">
<map name="map0"><%=chart0.imageMap%></map>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1.imageURL)%>'
    usemap="#map1" border="0">
<map name="map1"><%=chart1.imageMap%></map>
<img src='<%=response.encodeURL("getchart.jsp?"+chart2.imageURL)%>'
    usemap="#map2" border="0">
<map name="map2"><%=chart2.imageMap%></map>
<img src='<%=response.encodeURL("getchart.jsp?"+chart3.imageURL)%>'
    usemap="#map3" border="0">
<map name="map3"><%=chart3.imageMap%></map>
<img src='<%=response.encodeURL("getchart.jsp?"+chart4.imageURL)%>'
    usemap="#map4" border="0">
<map name="map4"><%=chart4.imageMap%></map>
</body>
</html>

