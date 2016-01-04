<%@page import="ChartDirector.*" %>
<%@page import="java.util.*" %>
<%
// In this example, we simply use random data for the 2 data series.
RanSeries r = new RanSeries(127);
double[] data0 = r.getSeries(180, 70, -5, 5);
double[] data1 = r.getSeries(180, 150, -15, 15);
Date[] timeStamps = r.getDateSeries(180, new GregorianCalendar(2014, 2, 1).getTime(), 86400);

// Create a XYChart object of size 640 x 420 pixels
XYChart c = new XYChart(640, 420);

// Add a title box using grey (0x555555) 20pt Arial Bold font
c.addTitle("   Plasma Stabilizer Energy Usage", "Arial Bold", 20, 0x555555);

// Set the plotarea at (70, 70) and of size 540 x 320 pixels, with transparent background and border
// and light grey (0xcccccc) horizontal grid lines
c.setPlotArea(70, 70, 540, 320, -1, -1, Chart.Transparent, 0xcccccc);

// Add a legend box with horizontal layout above the plot area at (70, 32). Use 12pt Arial Bold dark
// grey (0x555555) font, transparent background and border, and line style legend icon.
LegendBox b = c.addLegend(70, 32, false, "Arial Bold", 12);
b.setFontColor(0x555555);
b.setBackground(Chart.Transparent, Chart.Transparent);
b.setLineStyleKey();

// Set axis label font to 12pt Arial
c.xAxis().setLabelStyle("Arial", 12);
c.yAxis().setLabelStyle("Arial", 12);

// Set the x and y axis stems to transparent, and the x-axis tick color to grey (0xaaaaaa)
c.xAxis().setColors(Chart.Transparent, Chart.TextColor, Chart.TextColor, 0xaaaaaa);
c.yAxis().setColors(Chart.Transparent);

// Set the major/minor tick lengths for the x-axis to 10 and 0.
c.xAxis().setTickLength(10, 0);

// For the automatic axis labels, set the minimum spacing to 80/40 pixels for the x/y axis.
c.xAxis().setTickDensity(80);
c.yAxis().setTickDensity(40);

// Use "mm/yyyy" as the x-axis label format for the first plotted month of a year, and "mm" for
// other months
c.xAxis().setMultiFormat(Chart.StartOfYearFilter(), "{value|mm/yyyy} ", Chart.StartOfMonthFilter(),
    "{value|mm}");

// Add a title to the y axis using dark grey (0x555555) 12pt Arial Bold font
c.yAxis().setTitle("Energy (kWh)", "Arial Bold", 14, 0x555555);

// Add a line layer with 2-pixel line width
LineLayer layer0 = c.addLineLayer(data0, 0xcc0000, "Power Usage");
layer0.setXData(timeStamps);
layer0.setLineWidth(2);

// Add an area layer using semi-transparent blue (0x7f0044cc) as the fill color
AreaLayer layer1 = c.addAreaLayer(data1, 0x7f0044cc, "Effective Load");
layer1.setXData(timeStamps);
layer1.setBorderColor(Chart.SameAsMainColor);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='[{x|mm dd, yyyy}] {value} kWh'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Area Line Chart
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

