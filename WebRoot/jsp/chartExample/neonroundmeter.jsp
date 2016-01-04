<%@page import="ChartDirector.*" %>
<%@page import="javax.servlet.http.*" %>
<%!
// Function to create the demo charts
String createChart(HttpServletRequest request, int chartIndex)
{
    // The value to display on the meter
    double value = 50;

    // The main color of the four meters in this example. The other colors and gradients are derived
    // from the main color.
    int[] colorList = {0x007700, 0x770077, 0x0033dd, 0x880000};
    int mainColor = colorList[chartIndex];

    //
    // In this example, we demonstrate how to parameterized by size, so that the chart size can be
    // changed by changing just one variable.
    //
    int size = 300;

    // The radius of the entire meter, which is size / 2, minus 2 pixels for margin
    int outerRadius = size / 2 - 2;

    // The radius of the meter scale
    int scaleRadius = outerRadius * 92 / 100;

    // The radius of the inner decorative circle
    int innerRadius = scaleRadius * 40 / 100;

    // The width of the color scale
    int colorScaleWidth = scaleRadius * 10 / 100;

    // Major tick length
    int tickLength = scaleRadius * 10 / 100;

    // Major tick width
    int tickWidth = scaleRadius * 1 / 100 + 1;

    // Label font size
    int fontSize = scaleRadius * 13 / 100;

    //
    // Create an angular meter based on the above parameters
    //

    // Create an AngularMeter object of the specified size. In this demo, we use black (0x000000) as
    // the background color. You can also use transparent or other colors.
    AngularMeter m = new AngularMeter(size, size, 0x000000);

    // Set the default text and line colors to white (0xffffff)
    m.setColor(Chart.TextColor, 0xffffff);
    m.setColor(Chart.LineColor, 0xffffff);

    // Set meter center and scale radius, and set the scale angle from -180 to +90 degrees
    m.setMeter(size / 2, size / 2, scaleRadius, -180, 90);

    // Background gradient with the mainColor at the center and become darker near the border
    double[] bgGradient = {0, mainColor, 0.5, m.adjustBrightness(mainColor, 0.75), 1,
        m.adjustBrightness(mainColor, 0.15)};

    // Fill the meter background with the background gradient
    m.addRing(0, outerRadius, m.relativeRadialGradient(bgGradient, outerRadius * 0.66));

    // Fill the inner circle with the same background gradient for decoration
    m.addRing(0, innerRadius, m.relativeRadialGradient(bgGradient, innerRadius * 0.8));

    // Gradient for the neon backlight, with the main color at the scale radius fading to
    // transparent
    double[] neonGradient = {0.89, Chart.Transparent, 1, mainColor, 1.07, Chart.Transparent};
    m.addRing(scaleRadius * 85 / 100, outerRadius, m.relativeRadialGradient(neonGradient));

    // The neon ring at the scale radius with width equal to 1/80 of the scale radius, creating
    // using a brighter version of the main color
    m.addRing(scaleRadius, scaleRadius + scaleRadius / 80, m.adjustBrightness(mainColor, 2));

    // Meter scale is 0 - 100, with major/minor/micro ticks every 10/5/1 units
    m.setScale(0, 100, 10, 5, 1);

    // Set the scale label style, tick length and tick width. The minor and micro tick lengths are
    // 80% and 60% of the major tick length, and their widths are around half of the major tick
    // width.
    m.setLabelStyle("Arial Italic", fontSize);
    m.setTickLength(-tickLength, -tickLength * 80 / 100, -tickLength * 60 / 100);
    m.setLineWidth(0, tickWidth, (tickWidth + 1) / 2, (tickWidth + 1) / 2);

    // Demostrate different types of color scales and glare effects and putting them at different
    // positions.
    double[] smoothColorScale = {0, 0x0000ff, 25, 0x0088ff, 50, 0x00ff00, 75, 0xdddd00, 100,
        0xff0000};
    double[] stepColorScale = {0, 0x00dd00, 60, 0xddaa00, 80, 0xdd0000, 100};
    double[] highColorScale = {70, Chart.Transparent, 100, 0xff0000};

    if (chartIndex == 1) {
        // Add the smooth color scale just outside the inner circle
        m.addColorScale(smoothColorScale, innerRadius + 1, colorScaleWidth);
        // Add glare up to the scale radius, concave and spanning 190 degrees
        m.addGlare(scaleRadius, -190);
    } else if (chartIndex == 2) {
        // Add the high color scale at the default position
        m.addColorScale(highColorScale);
        // Add glare up to the scale radius
        m.addGlare(scaleRadius);
    } else {
        // Add the step color scale just outside the inner circle
        m.addColorScale(stepColorScale, innerRadius + 1, colorScaleWidth);
        // Add glare up to the scale radius, concave and spanning 190 degrees and rotated by -45
        // degrees
        m.addGlare(scaleRadius, -190, -45);
    }

    // Add a red (0xff0000) pointer at the specified value
    m.addPointer2(value, 0xff0000);

    // Set the cap background to a brighter version of the mainColor, and using black (0x000000) for
    // the cap and grey (0x999999) for the cap border
    m.setCap2(m.adjustBrightness(mainColor, 1.1), 0x000000, 0x999999);

    // Output the chart
    return m.makeSession(request, "chart" + chartIndex);
}
%>
<%
String chart0URL = createChart(request, 0);
String chart1URL = createChart(request, 1);
String chart2URL = createChart(request, 2);
String chart3URL = createChart(request, 3);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Neon Round Meters
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart0URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart2URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart3URL)%>'>
</body>
</html>

