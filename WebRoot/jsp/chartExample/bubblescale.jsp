<%@page import="ChartDirector.*" %>
<%
// The XY points for the bubble chart. The bubble chart has independent bubble size on the X and Y
// direction.
double[] dataX0 = {1000, 1500, 1700};
double[] dataY0 = {25, 20, 65};
double[] dataZX0 = {500, 200, 600};
double[] dataZY0 = {15, 30, 20};

double[] dataX1 = {500, 1000, 1300};
double[] dataY1 = {35, 50, 75};
double[] dataZX1 = {800, 300, 500};
double[] dataZY1 = {8, 27, 25};

double[] dataX2 = {150, 300};
double[] dataY2 = {20, 60};
double[] dataZX2 = {160, 400};
double[] dataZY2 = {30, 20};

// Create a XYChart object of size 450 x 420 pixels
XYChart c = new XYChart(450, 420);

// Set the plotarea at (55, 65) and of size 350 x 300 pixels, with a light grey border (0xc0c0c0).
// Turn on both horizontal and vertical grid lines with light grey color (0xc0c0c0)
c.setPlotArea(55, 65, 350, 300, -1, -1, 0xc0c0c0, 0xc0c0c0, -1);

// Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 12pt Times Bold
// Italic font. Set the background and border color to Transparent.
c.addLegend(50, 30, false, "Times New Roman Bold Italic", 12).setBackground(Chart.Transparent);

// Add a title to the chart using 18pt Times Bold Itatic font.
c.addTitle("Plasma Battery Comparison", "Times New Roman Bold Italic", 18);

// Add titles to the axes using 12pt Arial Bold Italic font
c.yAxis().setTitle("Operating Current", "Arial Bold Italic", 12);
c.xAxis().setTitle("Operating Voltage", "Arial Bold Italic", 12);

// Set the axes line width to 3 pixels
c.xAxis().setWidth(3);
c.yAxis().setWidth(3);

// Add (dataX0, dataY0) as a standard scatter layer, and also as a "bubble" scatter layer, using
// circles as symbols. The "bubble" scatter layer has symbol size modulated by (dataZX0, dataZY0)
// using the scale on the x and y axes.
c.addScatterLayer(dataX0, dataY0, "Vendor A", Chart.CircleSymbol, 9, 0xff3333, 0xff3333);
c.addScatterLayer(dataX0, dataY0, "", Chart.CircleSymbol, 9, 0x80ff3333, 0x80ff3333).setSymbolScale(
    dataZX0, Chart.XAxisScale, dataZY0, Chart.YAxisScale);

// Add (dataX1, dataY1) as a standard scatter layer, and also as a "bubble" scatter layer, using
// squares as symbols. The "bubble" scatter layer has symbol size modulated by (dataZX1, dataZY1)
// using the scale on the x and y axes.
c.addScatterLayer(dataX1, dataY1, "Vendor B", Chart.SquareSymbol, 7, 0x3333ff, 0x3333ff);
c.addScatterLayer(dataX1, dataY1, "", Chart.SquareSymbol, 9, 0x803333ff, 0x803333ff).setSymbolScale(
    dataZX1, Chart.XAxisScale, dataZY1, Chart.YAxisScale);

// Add (dataX2, dataY2) as a standard scatter layer, and also as a "bubble" scatter layer, using
// diamonds as symbols. The "bubble" scatter layer has symbol size modulated by (dataZX2, dataZY2)
// using the scale on the x and y axes.
c.addScatterLayer(dataX2, dataY2, "Vendor C", Chart.DiamondSymbol, 9, 0x00ff00, 0x00ff00);
c.addScatterLayer(dataX2, dataY2, "", Chart.DiamondSymbol, 9, 0x8033ff33, 0x8033ff33
    ).setSymbolScale(dataZX2, Chart.XAxisScale, dataZY2, Chart.YAxisScale);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='Voltage = {x} +/- {={zx}/2} V, Current = {value} +/- {={zy}/2} A'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Bubble XY Scaling
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

