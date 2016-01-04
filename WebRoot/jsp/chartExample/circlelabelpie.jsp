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
    double[] data = {42, 18, 8};

    // The labels for the pie chart
    String[] labels = {"Agree", "Disagree", "Not Sure"};

    // The colors to use for the sectors
    int[] colors = {0x66ff66, 0xff6666, 0xffff00};

    // Create a PieChart object of size 300 x 300 pixels. Set the background to a gradient color
    // from blue (aaccff) to sky blue (ffffff), with a grey (888888) border. Use rounded corners and
    // soft drop shadow.
    PieChart c = new PieChart(300, 300);
    c.setBackground(c.linearGradientColor(0, 0, 0, c.getHeight() / 2, 0xaaccff, 0xffffff), 0x888888)
        ;
    c.setRoundedFrame();
    c.setDropShadow();

    if (chartIndex == 0) {
    //============================================================
    //    Draw a pie chart where the label is on top of the pie
    //============================================================

        // Set the center of the pie at (150, 150) and the radius to 120 pixels
        c.setPieSize(150, 150, 120);

        // Set the label position to -40 pixels from the perimeter of the pie (-ve means label is
        // inside the pie)
        c.setLabelPos(-40);

    } else {
    //============================================================
    //    Draw a pie chart where the label is outside the pie
    //============================================================

        // Set the center of the pie at (150, 150) and the radius to 80 pixels
        c.setPieSize(150, 150, 80);

        // Set the sector label position to be 20 pixels from the pie. Use a join line to connect
        // the labels to the sectors.
        c.setLabelPos(20, Chart.LineColor);

    }

    // Set the pie data and the pie labels
    c.setData(data, labels);

    // Set the sector colors
    c.setColors2(Chart.DataColor, colors);

    // Use local gradient shading, with a 1 pixel semi-transparent black (bb000000) border
    c.setSectorStyle(Chart.LocalGradientShading, 0xbb000000, 1);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart" + chartIndex);

    // Include tool tip for the chart
    ret.imageMap = c.getHTMLImageMap("", "", "title='{label}: {value} responses ({percent}%)'");

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
    Circular Label Layout
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

