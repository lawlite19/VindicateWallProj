<%@page import="ChartDirector.*" %>
<%
// The XY points for the scatter chart
double[] dataX = {150, 400, 300, 1500, 800};
double[] dataY = {0.6, 8, 5.4, 2, 4};

// The labels for the points
String[] labels = {"Nano\n100", "SpeedTron\n200 Lite", "SpeedTron\n200", "Marathon\nExtra",
    "Marathon\n2000"};

// Create a XYChart object of size 450 x 400 pixels
XYChart c = new XYChart(450, 400);

// Set the plotarea at (55, 40) and of size 350 x 300 pixels, with a light grey border (0xc0c0c0).
// Turn on both horizontal and vertical grid lines with light grey color (0xc0c0c0)
c.setPlotArea(55, 40, 350, 300, 0xffffff, -1, 0xc0c0c0, 0xc0c0c0, -1);

// Add a title to the chart using 18pt Times Bold Itatic font.
c.addTitle("Product Comparison Chart", "Times New Roman Bold Italic", 18);

// Add a title to the y axis using 12pt Arial Bold Italic font
c.yAxis().setTitle("Capacity (tons)", "Arial Bold Italic", 12);

// Add a title to the x axis using 12pt Arial Bold Italic font
c.xAxis().setTitle("Range (miles)", "Arial Bold Italic", 12);

// Set the axes line width to 3 pixels
c.xAxis().setWidth(3);
c.yAxis().setWidth(3);

// Add the data as a scatter chart layer, using a 15 pixel circle as the symbol
ScatterLayer layer = c.addScatterLayer(dataX, dataY, "", Chart.GlassSphereShape, 15, 0xff3333,
    0xff3333);

// Add labels to the chart as an extra field
layer.addExtraField(labels);

// Set the data label format to display the extra field
layer.setDataLabelFormat("{field0}");

// Use 8pt Arial Bold to display the labels
TextBox textbox = layer.setDataLabelStyle("Arial Bold", 8);

// Set the background to purple with a 1 pixel 3D border
textbox.setBackground(0xcc99ff, Chart.Transparent, 1);

// Put the text box 4 pixels to the right of the data point
textbox.setAlignment(Chart.Left);
textbox.setPos(4, 0);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='Range = {x} miles, Capacity = {value} tons'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Custom Scatter Labels
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

