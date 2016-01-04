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
    // The data for the pie chart
    double[] data = {25, 18, 15, 12, 8, 30, 35};

    // The labels for the pie chart
    String[] labels = {"Labor", "Licenses", "Taxes", "Legal", "Insurance", "Facilities",
        "Production"};

    // Create a PieChart object of size 280 x 240 pixels
    PieChart c = new PieChart(280, 240);

    // Set the center of the pie at (140, 130) and the radius to 80 pixels
    c.setPieSize(140, 130, 80);

    // Add a title to the pie to show the start angle and direction
    if (chartIndex == 0) {
        c.addTitle("Start Angle = 0 degrees\nDirection = Clockwise");
    } else {
        c.addTitle("Start Angle = 90 degrees\nDirection = AntiClockwise");
        c.setStartAngle(90, false);
    }

    // Draw the pie in 3D
    c.set3D();

    // Set the pie data and the pie labels
    c.setData(data, labels);

    // Explode the 1st sector (index = 0)
    c.setExplode(0);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart" + chartIndex);

    // Include tool tip for the chart
    ret.imageMap = c.getHTMLImageMap("", "", "title='{label}: US${value}K ({percent}%)'");

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
    Start Angle and Direction
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

