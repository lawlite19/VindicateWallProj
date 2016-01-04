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
    // the tilt angle of the pie
    int angle = chartIndex * 15;

    // The data for the pie chart
    double[] data = {25, 18, 15, 12, 8, 30, 35};

    // The labels for the pie chart
    String[] labels = {"Labor", "Licenses", "Taxes", "Legal", "Insurance", "Facilities",
        "Production"};

    // Create a PieChart object of size 100 x 110 pixels
    PieChart c = new PieChart(100, 110);

    // Set the center of the pie at (50, 55) and the radius to 38 pixels
    c.setPieSize(50, 55, 38);

    // Set the depth and tilt angle of the 3D pie (-1 means auto depth)
    c.set3D(-1, angle);

    // Add a title showing the tilt angle
    c.addTitle("Tilt = " + angle + " deg", "Arial", 8);

    // Set the pie data
    c.setData(data, labels);

    // Disable the sector labels by setting the color to Transparent
    c.setLabelStyle("", 8, Chart.Transparent);

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
ImageWithHotSpot chart2 = createChart(request, 2);
ImageWithHotSpot chart3 = createChart(request, 3);
ImageWithHotSpot chart4 = createChart(request, 4);
ImageWithHotSpot chart5 = createChart(request, 5);
ImageWithHotSpot chart6 = createChart(request, 6);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    3D Angle
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
<img src='<%=response.encodeURL("getchart.jsp?"+chart5.imageURL)%>'
    usemap="#map5" border="0">
<map name="map5"><%=chart5.imageMap%></map>
<img src='<%=response.encodeURL("getchart.jsp?"+chart6.imageURL)%>'
    usemap="#map6" border="0">
<map name="map6"><%=chart6.imageMap%></map>
</body>
</html>

