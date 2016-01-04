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
    double bargap = chartIndex * 0.25 - 0.25;

    // The data for the bar chart
    double[] data = {100, 125, 245, 147, 67};

    // The labels for the bar chart
    String[] labels = {"Mon", "Tue", "Wed", "Thu", "Fri"};

    // Create a XYChart object of size 150 x 150 pixels
    XYChart c = new XYChart(150, 150);

    // Set the plotarea at (27, 20) and of size 120 x 100 pixels
    c.setPlotArea(27, 20, 120, 100);

    // Set the labels on the x axis
    c.xAxis().setLabels(labels);

    if (bargap >= 0) {
        // Add a title to display to bar gap using 8pt Arial font
        c.addTitle("      Bar Gap = " + bargap, "Arial", 8);
    } else {
        // Use negative value to mean TouchBar
        c.addTitle("      Bar Gap = TouchBar", "Arial", 8);
        bargap = Chart.TouchBar;
    }

    // Add a bar chart layer using the given data and set the bar gap
    c.addBarLayer(data).setBarGap(bargap);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart" + chartIndex);

    // Include tool tip for the chart
    ret.imageMap = c.getHTMLImageMap("", "", "title='Production on {xLabel}: {value} kg'");

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
    Bar Gap
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
</body>
</html>

