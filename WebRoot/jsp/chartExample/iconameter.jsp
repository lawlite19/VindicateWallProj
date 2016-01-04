<%@page import="ChartDirector.*" %>
<%
// The value to display on the meter
double value = 85;

// Create an AugularMeter object of size 70 x 90 pixels, using black background with a 2 pixel 3D
// depressed border.
AngularMeter m = new AngularMeter(70, 90, 0, 0, -2);

//Set search path to current JSP directory for loading icon images
m.setSearchPath(getServletConfig().getServletContext(), request);

// Use white on black color palette for default text and line colors
m.setColors(Chart.whiteOnBlackPalette);

// Set the meter center at (10, 45), with radius 50 pixels, and span from 135 to 45 degrees
m.setMeter(10, 45, 50, 135, 45);

// Set meter scale from 0 - 100, with the specified labels
m.setScale2(0, 100, new String[]{"E", " ", " ", " ", "F"});

// Set the angular arc and major tick width to 2 pixels
m.setLineWidth(2, 2);

// Add a red zone at 0 - 15
m.addZone(0, 15, 0xff3333);

// Add an icon at (25, 35)
m.addText(25, 35, "<*img=gas.gif*>");

// Add a yellow (ffff00) pointer at the specified value
m.addPointer(value, 0xffff00);

// Output the chart
String chart1URL = m.makeSession(request, "chart1");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Icon Angular Meter
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'>
</body>
</html>

