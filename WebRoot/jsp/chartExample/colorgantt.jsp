<%@page import="ChartDirector.*" %>
<%@page import="java.util.*" %>
<%
// The tasks for the gantt chart
String[] labels = {"Market Research", "Define Specifications", "Overall Archiecture",
    "Project Planning", "Detail Design", "Software Development", "Test Plan", "Testing and QA",
    "User Documentation"};

// The task index, start date, end date and color for each bar
double[] taskNo = {0, 0, 1, 2, 3, 4, 5, 6, 6, 7, 8, 8};
Date[] startDate = {new GregorianCalendar(2004, 7, 16).getTime(), new GregorianCalendar(2004, 9, 4
    ).getTime(), new GregorianCalendar(2004, 7, 30).getTime(), new GregorianCalendar(2004, 8, 13
    ).getTime(), new GregorianCalendar(2004, 8, 20).getTime(), new GregorianCalendar(2004, 8, 27
    ).getTime(), new GregorianCalendar(2004, 9, 4).getTime(), new GregorianCalendar(2004, 9, 4
    ).getTime(), new GregorianCalendar(2004, 9, 25).getTime(), new GregorianCalendar(2004, 10, 1
    ).getTime(), new GregorianCalendar(2004, 9, 18).getTime(), new GregorianCalendar(2004, 10, 8
    ).getTime()};
Date[] endDate = {new GregorianCalendar(2004, 7, 30).getTime(), new GregorianCalendar(2004, 9, 18
    ).getTime(), new GregorianCalendar(2004, 8, 13).getTime(), new GregorianCalendar(2004, 8, 27
    ).getTime(), new GregorianCalendar(2004, 9, 4).getTime(), new GregorianCalendar(2004, 9, 11
    ).getTime(), new GregorianCalendar(2004, 10, 8).getTime(), new GregorianCalendar(2004, 9, 18
    ).getTime(), new GregorianCalendar(2004, 10, 8).getTime(), new GregorianCalendar(2004, 10, 22
    ).getTime(), new GregorianCalendar(2004, 10, 1).getTime(), new GregorianCalendar(2004, 10, 22
    ).getTime()};
int[] colors = {0x00cc00, 0x00cc00, 0x00cc00, 0x0000cc, 0x0000cc, 0xcc0000, 0xcc0000, 0x0000cc,
    0xcc0000, 0xcc0000, 0x00cc00, 0xcc0000};

// Create a XYChart object of size 620 x 325 pixels. Set background color to light red (0xffcccc),
// with 1 pixel 3D border effect.
XYChart c = new XYChart(620, 325, 0xffcccc, 0x000000, 1);

// Add a title to the chart using 15 points Times Bold Itatic font, with white (ffffff) text on a
// dark red (800000) background
c.addTitle("Mutli-Color Gantt Chart Demo", "Times New Roman Bold Italic", 15, 0xffffff
    ).setBackground(0x800000);

// Set the plotarea at (140, 55) and of size 460 x 200 pixels. Use alternative white/grey
// background. Enable both horizontal and vertical grids by setting their colors to grey (c0c0c0).
// Set vertical major grid (represents month boundaries) 2 pixels in width
c.setPlotArea(140, 55, 460, 200, 0xffffff, 0xeeeeee, Chart.LineColor, 0xc0c0c0, 0xc0c0c0
    ).setGridWidth(2, 1, 1, 1);

// swap the x and y axes to create a horziontal box-whisker chart
c.swapXY();

// Set the y-axis scale to be date scale from Aug 16, 2004 to Nov 22, 2004, with ticks every 7 days
// (1 week)
c.yAxis().setDateScale(new GregorianCalendar(2004, 7, 16).getTime(), new GregorianCalendar(2004, 10,
    22).getTime(), 86400 * 7);

// Set multi-style axis label formatting. Month labels are in Arial Bold font in "mmm d" format.
// Weekly labels just show the day of month and use minor tick (by using '-' as first character of
// format string).
c.yAxis().setMultiFormat(Chart.StartOfMonthFilter(), "<*font=Arial Bold*>{value|mmm d}",
    Chart.StartOfDayFilter(), "-{value|d}");

// Set the y-axis to shown on the top (right + swapXY = top)
c.setYAxisOnRight();

// Set the labels on the x axis
c.xAxis().setLabels(labels);

// Reverse the x-axis scale so that it points downwards.
c.xAxis().setReverse();

// Set the horizontal ticks and grid lines to be between the bars
c.xAxis().setTickOffset(0.5);

// Add some symbols to the chart to represent milestones. The symbols are added using scatter
// layers. We need to specify the task index, date, name, symbol shape, size and color.
c.addScatterLayer(new double[]{1}, Chart.CTime(new Date[]{new GregorianCalendar(2004, 8, 13
    ).getTime()}), "Milestone 1", Chart.Cross2Shape(), 13, 0xffff00).setHTMLImageMap("{disable}");
c.addScatterLayer(new double[]{3}, Chart.CTime(new Date[]{new GregorianCalendar(2004, 9, 4).getTime(
    )}), "Milestone 2", Chart.StarShape(5), 15, 0xff00ff).setHTMLImageMap("{disable}");
c.addScatterLayer(new double[]{5}, Chart.CTime(new Date[]{new GregorianCalendar(2004, 10, 8
    ).getTime()}), "Milestone 3", Chart.TriangleSymbol, 13, 0xff9933).setHTMLImageMap("{disable}");

// Add a multi-color box-whisker layer to represent the gantt bars
BoxWhiskerLayer layer = c.addBoxWhiskerLayer2(Chart.CTime(startDate), Chart.CTime(endDate), null,
    null, null, colors);
layer.setXData(taskNo);
layer.setBorderColor(Chart.SameAsMainColor);

// Divide the plot area height ( = 200 in this chart) by the number of tasks to get the height of
// each slot. Use 80% of that as the bar height.
layer.setDataWidth((int)(200 * 4 / 5 / labels.length));

// Add a legend box at (140, 265) - bottom of the plot area. Use 8pt Arial Bold as the font with
// auto-grid layout. Set the width to the same width as the plot area. Set the backgorund to grey
// (dddddd).
LegendBox legendBox = c.addLegend2(140, 265, Chart.AutoGrid, "Arial Bold", 8);
legendBox.setWidth(461);
legendBox.setBackground(0xdddddd);

// The keys for the scatter layers (milestone symbols) will automatically be added to the legend
// box. We just need to add keys to show the meanings of the bar colors.
legendBox.addKey("Market Team", 0x00cc00);
legendBox.addKey("Planning Team", 0x0000cc);
legendBox.addKey("Development Team", 0xcc0000);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='{xLabel}: {top|mmm dd, yyyy} to {bottom|mmm dd, yyyy}'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Multi-Color Gantt Chart
</div>
<hr color="#000080">
<div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'
    usemap="#map1" border="0">
<map name="map1"><%=imageMap1%></map>
</body>
</html>

