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
    double[] data = {85, 156, 179.5, 211, 123};
    String[] labels = {"Mon", "Tue", "Wed", "Thu", "Fri"};

    // Create a XYChart object of size 270 x 270 pixels
    XYChart c = new XYChart(270, 270);

    //Set search path to current JSP directory for loading icon images
    c.setSearchPath(getServletConfig().getServletContext(), request);

    // Set the plot area at (40, 32) and of size 200 x 200 pixels
    PlotArea plotarea = c.setPlotArea(40, 32, 200, 200);

    // Set the background style based on the input parameter
    if (chartIndex == 0) {
        // Has wallpaper image
        c.setWallpaper("tile.gif");
    } else if (chartIndex == 1) {
        // Use a background image as the plot area background
        plotarea.setBackground2("bg.png");
    } else if (chartIndex == 2) {
        // Use white (0xffffff) and grey (0xe0e0e0) as two alternate plotarea background colors
        plotarea.setBackground(0xffffff, 0xe0e0e0);
    } else {
        // Use a dark background palette
        c.setColors(Chart.whiteOnBlackPalette);
    }

    // Set the labels on the x axis
    c.xAxis().setLabels(labels);

    // Add a color bar layer using the given data. Use a 1 pixel 3D border for the bars.
    c.addBarLayer3(data).setBorderColor(-1, 1);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart" + chartIndex);

    // Include tool tip for the chart
    ret.imageMap = c.getHTMLImageMap("", "", "title='Revenue for {xLabel}: US${value}K'");

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
    Background and Wallpaper
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
</body>
</html>

