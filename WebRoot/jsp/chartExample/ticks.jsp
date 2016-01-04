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
    double[] data = {100, 125, 265, 147, 67, 105};
    String[] labels = {"Jan", "Feb", "Mar", "Apr", "May", "Jun"};

    // Create a XYChart object of size 250 x 250 pixels
    XYChart c = new XYChart(250, 250);

    // Set the plot area at (27, 25) and of size 200 x 200 pixels
    c.setPlotArea(27, 25, 200, 200);

    if (chartIndex == 1) {
        // High tick density, uses 10 pixels as tick spacing
        c.addTitle("Tick Density = 10 pixels");
        c.yAxis().setTickDensity(10);
    } else {
        // Normal tick density, just use the default setting
        c.addTitle("Default Tick Density");
    }

    // Set the labels on the x axis
    c.xAxis().setLabels(labels);

    // Add a color bar layer using the given data. Use a 1 pixel 3D border for the bars.
    c.addBarLayer3(data).setBorderColor(-1, 1);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart" + chartIndex);

    // Include tool tip for the chart
    ret.imageMap = c.getHTMLImageMap("", "", "title='Revenue for {xLabel}: US${value}M'");

    return ret;
}
%>
<%
ImageWithHotSpot chart0 = createChart(request, 0);
ImageWithHotSpot chart1 = createChart(request, 1);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Tick Density
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
</body>
</html>

