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
    // The value to display on the meter
    double value = 75.35;

    // Create a LinearMeter object of size 70 x 240 pixels with very light grey (0xeeeeee)
    // backgruond and a light grey (0xccccccc) 3-pixel thick rounded frame
    LinearMeter m = new LinearMeter(70, 240, 0xeeeeee, 0xcccccc);
    m.setRoundedFrame(Chart.Transparent);
    m.setThickFrame(3);

    // This example demonstrates putting the text labels at the left or right side by setting the
    // label alignment and scale position.
    if (chartIndex == 0) {
        m.setMeter(28, 18, 20, 205, Chart.Left);
    } else {
        m.setMeter(20, 18, 20, 205, Chart.Right);
    }

    // Set meter scale from 0 - 100, with a tick every 10 units
    m.setScale(0, 100, 10);

    // Add a smooth color scale to the meter
    double[] smoothColorScale = {0, 0x6666ff, 25, 0x00bbbb, 50, 0x00ff00, 75, 0xffff00, 100,
        0xff0000};
    m.addColorScale(smoothColorScale);

    // Add a blue (0x0000cc) pointer at the specified value
    m.addPointer(value, 0x0000cc);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = m.makeSession(request, "chart" + chartIndex);
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
    V-Linear Meter Orientation
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart0.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1.imageURL)%>'>
</body>
</html>

