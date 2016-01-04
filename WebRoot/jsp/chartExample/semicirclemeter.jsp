<%@page import="ChartDirector.*" %>
<%
// The value to display on the meter
double value = 72.55;

// Create an AngularMeter object of size 300 x 180 pixels with transparent background
AngularMeter m = new AngularMeter(300, 180, Chart.Transparent);

// Center at (150, 150), scale radius = 128 pixels, scale angle -90 to +90 degrees
m.setMeter(150, 150, 128, -90, 90);

// Add a pale grey (0xeeeeee) scale background of 148 pixels radius, with a 10 pixel thick light
// grey (0xcccccc) border
m.addScaleBackground(148, 0xeeeeee, 10, 0xcccccc);

// Meter scale is 0 - 100, with major tick every 20 units, minor tick every 10 units, and micro tick
// every 5 units
m.setScale(0, 100, 20, 10, 5);

// Set the scale label style to 15pt Arial Italic. Set the major/minor/micro tick lengths to
// 16/16/10 pixels pointing inwards, and their widths to 2/1/1 pixels.
m.setLabelStyle("Arial Italic", 16);
m.setTickLength(-16, -16, -10);
m.setLineWidth(0, 2, 1, 1);

// Add a smooth color scale to the meter
double[] smoothColorScale = {0, 0x3333ff, 25, 0x0088ff, 50, 0x00ff00, 75, 0xdddd00, 100, 0xff0000};
m.addColorScale(smoothColorScale);

// Add a text label centered at (150, 125) with 15pt Arial Italic font
m.addText(150, 125, "CPU", "Arial Italic", 15, Chart.TextColor, Chart.BottomCenter);

// Add a red (0xff0000) pointer at the specified value
m.addPointer2(value, 0xff0000);

// Output the chart
String chart1URL = m.makeSession(request, "chart1");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Semicircle Meter
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'>
</body>
</html>

