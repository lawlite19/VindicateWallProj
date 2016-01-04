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
    double[] data0 = {25, 18, 15};
    double[] data1 = {14, 32, 24};
    double[] data2 = {25, 23, 9};

    // The labels for the pie chart
    String[] labels = {"Software", "Hardware", "Services"};

    // Create a PieChart object of size 180 x 160 pixels
    PieChart c = new PieChart(180, 160);

    // Set the center of the pie at (90, 80) and the radius to 60 pixels
    c.setPieSize(90, 80, 60);

    // Set the border color of the sectors to white (ffffff)
    c.setLineColor(0xffffff);

    // Set the background color of the sector label to pale yellow (ffffc0) with a black border
    // (000000)
    c.setLabelStyle().setBackground(0xffffc0, 0x000000);

    // Set the label to be slightly inside the perimeter of the circle
    c.setLabelLayout(Chart.CircleLayout, -10);

    // Set the title, data and colors according to which pie to draw
    if (chartIndex == 0) {
        c.addTitle("Alpha Division", "Arial Bold", 8);
        c.setData(data0, labels);
        c.setColors2(Chart.DataColor, new int[]{0xff3333, 0xff9999, 0xffcccc});
    } else if (chartIndex == 1) {
        c.addTitle("Beta Division", "Arial Bold", 8);
        c.setData(data1, labels);
        c.setColors2(Chart.DataColor, new int[]{0x33ff33, 0x99ff99, 0xccffcc});
    } else {
        c.addTitle("Gamma Division", "Arial Bold", 8);
        c.setData(data2, labels);
        c.setColors2(Chart.DataColor, new int[]{0x3333ff, 0x9999ff, 0xccccff});
    }

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart" + chartIndex);

    // Include tool tip for the chart
    ret.imageMap = c.getHTMLImageMap("", "", "title='{label}: US${value}M ({percent}%)'");

    return ret;
}
%>
<%
ImageWithHotSpot chart0 = createChart(request, 0);
ImageWithHotSpot chart1 = createChart(request, 1);
ImageWithHotSpot chart2 = createChart(request, 2);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Multi-Pie Chart
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
</body>
</html>

