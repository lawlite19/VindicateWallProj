<%@page import="ChartDirector.*" %>
<%@page import="javax.servlet.http.*" %>
<%!
// Function to create the demo charts
String createChart(HttpServletRequest request, int chartIndex)
{
    // The value to display on the meter
    double value = 72.55;

    // Create an AngularMeter object of size 300 x 180 pixels with transparent background
    AngularMeter m = new AngularMeter(300, 180, Chart.Transparent);

    // Set the default text and line colors to very dark grey (0x222222)
    m.setColor(Chart.TextColor, 0x222222);
    m.setColor(Chart.LineColor, 0x222222);

    // Center at (150, 150), scale radius = 128 pixels, scale angle -90 to +90 degrees
    m.setMeter(150, 150, 128, -90, 90);

    // Gradient color for the border to make it silver-like
    double[] ringGradient = {1, 0x999999, 0.5, 0xdddddd, 0, 0xf8f8f8, -0.5, 0xdddddd, -1, 0x999999};

    // Background gradient color from white (0xffffff) at the center to light grey (0xdddddd) at the
    // border
    double[] bgGradient = {0, 0xffffff, 0.75, 0xeeeeee, 1, 0xdddddd};

    // Add a scale background of 148 pixels radius using the gradient background, with a 10 pixel
    // thick silver border
    m.addScaleBackground(148, m.relativeRadialGradient(bgGradient, 148), 10,
        m.relativeLinearGradient(ringGradient, 45, 148));

    // Add a 1 pixel light grey (0xbbbbbb) line at the inner edge of the thick silver border (radius
    // = 138) to enhance its contrast with the background gradient
    m.addScaleBackground(138, Chart.Transparent, 1, 0xbbbbbb);

    // Meter scale is 0 - 100, with major tick every 20 units, minor tick every 10 units, and micro
    // tick every 5 units
    m.setScale(0, 100, 20, 10, 5);

    // Set the scale label style to 15pt Arial Italic. Set the major/minor/micro tick lengths to
    // 16/16/10 pixels pointing inwards, and their widths to 2/1/1 pixels.
    m.setLabelStyle("Arial Italic", 16);
    m.setTickLength(-16, -16, -10);
    m.setLineWidth(0, 2, 1, 1);

    // Demostrate different types of color scales and putting them at different positions
    double[] smoothColorScale = {0, 0x3333ff, 25, 0x0088ff, 50, 0x00ff00, 75, 0xdddd00, 100,
        0xff0000};
    double[] stepColorScale = {0, 0x00cc00, 60, 0xffdd00, 80, 0xee0000, 100};
    double[] highLowColorScale = {0, 0x00ff00, 70, Chart.Transparent, 100, 0xff0000};

    if (chartIndex == 0) {
        // Add the smooth color scale at the default position
        m.addColorScale(smoothColorScale);
    } else if (chartIndex == 1) {
        // Add the smooth color scale starting at radius 128 with zero width and ending at radius
        // 128 with 16 pixels inner width
        m.addColorScale(smoothColorScale, 128, 0, 128, -16);
    } else if (chartIndex == 2) {
        // Add the smooth color scale starting at radius 70 with zero width and ending at radius 60
        // with 20 pixels outer width
        m.addColorScale(smoothColorScale, 70, 0, 60, 20);
    } else if (chartIndex == 3) {
        // Add the high/low color scale at the default position
        m.addColorScale(highLowColorScale);
    } else if (chartIndex == 4) {
        // Add the step color scale at the default position
        m.addColorScale(stepColorScale);
    } else {
        // Add the smooth color scale at radius 60 with 15 pixels outer width
        m.addColorScale(smoothColorScale, 60, 15);
    }

    // Add a text label centered at (150, 125) with 15pt Arial Italic font
    m.addText(150, 125, "CPU", "Arial Italic", 15, Chart.TextColor, Chart.BottomCenter);

    // Add a red (0xff0000) pointer at the specified value
    m.addPointer2(value, 0xff0000);

    // Output the chart
    return m.makeSession(request, "chart" + chartIndex);
}
%>
<%
String chart0URL = createChart(request, 0);
String chart1URL = createChart(request, 1);
String chart2URL = createChart(request, 2);
String chart3URL = createChart(request, 3);
String chart4URL = createChart(request, 4);
String chart5URL = createChart(request, 5);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    White Semicircle Meters
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart0URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart2URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart3URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart4URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart5URL)%>'>
</body>
</html>

