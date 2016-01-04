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
    double[] data = {18, 30, 20, 15};

    // The labels for the pie chart
    String[] labels = {"Labor", "Licenses", "Facilities", "Production"};

    // The colors to use for the sectors
    int[] colors = {0x66aaee, 0xeebb22, 0xbbbbbb, 0x8844ff};

    // Create a PieChart object of size 200 x 220 pixels. Use a vertical gradient color from blue
    // (0000cc) to deep blue (000044) as background. Use rounded corners of 16 pixels radius.
    PieChart c = new PieChart(200, 220);
    c.setBackground(c.linearGradientColor(0, 0, 0, c.getHeight(), 0x0000cc, 0x000044));
    c.setRoundedFrame(0xffffff, 16);

    // Set donut center at (100, 120), and outer/inner radii as 80/40 pixels
    c.setDonutSize(100, 120, 80, 40);

    // Set the pie data
    c.setData(data, labels);

    // Set the sector colors
    c.setColors2(Chart.DataColor, colors);

    // Demonstrates various shading modes
    if (chartIndex == 0) {
        c.addTitle("Default Shading", "bold", 12, 0xffffff);
    } else if (chartIndex == 1) {
        c.addTitle("Local Gradient", "bold", 12, 0xffffff);
        c.setSectorStyle(Chart.LocalGradientShading);
    } else if (chartIndex == 2) {
        c.addTitle("Global Gradient", "bold", 12, 0xffffff);
        c.setSectorStyle(Chart.GlobalGradientShading);
    } else if (chartIndex == 3) {
        c.addTitle("Concave Shading", "bold", 12, 0xffffff);
        c.setSectorStyle(Chart.ConcaveShading);
    } else if (chartIndex == 4) {
        c.addTitle("Rounded Edge", "bold", 12, 0xffffff);
        c.setSectorStyle(Chart.RoundedEdgeShading);
    } else if (chartIndex == 5) {
        c.addTitle("Radial Gradient", "bold", 12, 0xffffff);
        c.setSectorStyle(Chart.RadialShading);
    } else if (chartIndex == 6) {
        c.addTitle("Ring Shading", "bold", 12, 0xffffff);
        c.setSectorStyle(Chart.RingShading);
    }

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
    2D Donut Shading
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

