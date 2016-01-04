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
    double value = 74.25;

    // Create a LinearMeter object of size 250 x 75 pixels with very light grey (0xeeeeee)
    // backgruond and a light grey (0xccccccc) 3-pixel thick rounded frame
    LinearMeter m = new LinearMeter(250, 75, 0xeeeeee, 0xcccccc);
    m.setRoundedFrame(Chart.Transparent);
    m.setThickFrame(3);

    // This example demonstrates putting the text labels at the top or bottom. This is by setting
    // the label alignment, scale position and label position.
    int[] alignment = {Chart.Top, Chart.Top, Chart.Bottom, Chart.Bottom};
    int[] meterYPos = {23, 23, 34, 34};
    int[] labelYPos = {61, 61, 15, 15};

    // Set the scale region
    m.setMeter(14, meterYPos[chartIndex], 218, 20, alignment[chartIndex]);

    // Set meter scale from 0 - 100, with a tick every 10 units
    m.setScale(0, 100, 10);

    // Add a smooth color scale at the default position
    double[] smoothColorScale = {0, 0x6666ff, 25, 0x00bbbb, 50, 0x00ff00, 75, 0xffff00, 100,
        0xff0000};
    m.addColorScale(smoothColorScale);

    // Add a blue (0x0000cc) pointer at the specified value
    m.addPointer(value, 0x0000cc);

    //
    // In this example, some charts have the "Temperauture" label on the left side and the value
    // readout on the right side, and some charts have the reverse
    //

    if (chartIndex % 2 == 0) {
        // Add a label on the left side using 8pt Arial Bold font
        m.addText(10, labelYPos[chartIndex], "Temperature C", "Arial Bold", 8, Chart.TextColor,
            Chart.Left);

        // Add a text box on the right side. Display the value using white (0xffffff) 8pt Arial Bold
        // font on a black (0x000000) background with depressed rounded border.
        TextBox t = m.addText(235, labelYPos[chartIndex], m.formatValue(value, "2"), "Arial Bold",
            8, 0xffffff, Chart.Right);
        t.setBackground(0x000000, 0x000000, -1);
        t.setRoundedCorners(3);
    } else {
        // Add a label on the right side using 8pt Arial Bold font
        m.addText(237, labelYPos[chartIndex], "Temperature C", "Arial Bold", 8, Chart.TextColor,
            Chart.Right);

        // Add a text box on the left side. Display the value using white (0xffffff) 8pt Arial Bold
        // font on a black (0x000000) background with depressed rounded border.
        TextBox t = m.addText(11, labelYPos[chartIndex], m.formatValue(value, "2"), "Arial Bold", 8,
            0xffffff, Chart.Left);
        t.setBackground(0x000000, 0x000000, -1);
        t.setRoundedCorners(3);
    }

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = m.makeSession(request, "chart" + chartIndex);
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
    H-Linear Meter Orientation
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart0.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart2.imageURL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart3.imageURL)%>'>
</body>
</html>

