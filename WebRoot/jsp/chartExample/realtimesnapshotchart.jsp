<%@page import="ChartDirector.*" %>
<%@page import="java.util.*" %>
<%
//
// Data to draw the chart. In this demo, the data buffer will be filled by a random data generator.
// In real life, the data is probably stored in a buffer (eg. a database table, a text file, or some
// global memory) and updated by other means.
//

// We use a data buffer to emulate the last 240 samples.
int sampleSize = 240;
double[] dataSeries1 = new double[sampleSize];
double[] dataSeries2 = new double[sampleSize];
double[] dataSeries3 = new double[sampleSize];
Date[] timeStamps = new Date[sampleSize];

// Our pseudo random number generator
double firstDate = new Date().getTime() / 1000 - timeStamps.length;
for (int i = 0; i < timeStamps.length; ++i) {
    double p = firstDate + i;
    timeStamps[i] = new Date((long)p * 1000);
    dataSeries1[i] = Math.cos(p * 2.1) * 10 + 1 / (Math.cos(p) * Math.cos(p) + 0.01) + 20;
    dataSeries2[i] = 100 * Math.sin(p / 27.7) * Math.sin(p / 10.1) + 150;
    dataSeries3[i] = 100 * Math.cos(p / 6.7) * Math.cos(p / 11.9) + 150;
}

// Create an XYChart object 600 x 320 pixels in size
XYChart c = new XYChart(600, 320);

// Set the plotarea at (55, 60) and of size 520 x 235 pixels with transparent background and border.
// Enable both horizontal and vertical grids by setting their colors to grey (cccccc). Set clipping
// mode to clip the data lines to the plot area.
c.setPlotArea(55, 60, 520, 235, -1, -1, Chart.Transparent, 0xcccccc, 0xcccccc);
c.setClipping();

// Add a title to the chart using dark grey (0x333333) 20pt Arial Bold font
c.addTitle("Realtime Chart with Snapshot", "Arial Bold", 20, 0x333333);

// Add a legend box at the top of the plot area using horizontal layout. Use 10pt Arial Bold font,
// transparent background and border, and line style legend icon.
LegendBox b = c.addLegend(55, 30, false, "Arial Bold", 10);
b.setBackground(Chart.Transparent, Chart.Transparent);
b.setLineStyleKey();

// Set the x and y axis stems to transparent and the label font to 10pt Arial
c.xAxis().setColors(Chart.Transparent);
c.yAxis().setColors(Chart.Transparent);
c.xAxis().setLabelStyle("Arial", 10);
c.yAxis().setLabelStyle("Arial", 10);

// Add y-axis title using 12pt Arial font
c.yAxis().setTitle("Y-Axis Title Placeholder", "Arial", 12);

// For the automatic x and y axis labels, set the minimum spacing to 75 and 30 pixels.
c.xAxis().setTickDensity(75);
c.yAxis().setTickDensity(30);

// Set the x-axis label format
c.xAxis().setLabelFormat("{value|hh:nn:ss}");

// Create a line layer to plot the lines
LineLayer layer = c.addLineLayer2();

// The x-coordinates are the timeStamps.
layer.setXData(timeStamps);

// The 3 data series are used to draw 3 lines. Here we put the latest data values as part of the
// data set name, so you can see them updated in the legend box.
layer.addDataSet(dataSeries1, 0xff0000, c.formatValue(dataSeries1[dataSeries1.length - 1],
    "Alpha: {value|2}"));
layer.addDataSet(dataSeries2, 0x00cc00, c.formatValue(dataSeries2[dataSeries2.length - 1],
    "Beta: {value|2}"));
layer.addDataSet(dataSeries3, 0x0000ff, c.formatValue(dataSeries3[dataSeries3.length - 1],
    "Gamma: {value|2}"));

// Generate the download filename if it is a download request
String format = request.getParameter("download");
String filename = null;
if ((null != format) && ("" != format)) {
    filename = "demo_" + c.formatValue(timeStamps[timeStamps.length - 1], "yyyymmddhhnnss") +
        "." + format;
}

// Output the chart and specify if it is an attachment
String chart1URL = c.makeSession(request, "chart1", "pdf".equals(format) ? Chart.PDF : Chart.PNG,
    filename, null != filename);

// Stream chart directly to browser
pageContext.forward("getchart.jsp?" + chart1URL);
%>

