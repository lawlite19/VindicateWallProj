<%@page import="ChartDirector.*" %>
<%
//
// Displays the monthly revenue for the selected year. The selected year should be passed in as a
// query parameter called "xLabel"
//
int selectedYear = (request.getParameter("xLabel") == null) ? 2001 :
    Integer.parseInt(request.getParameter("xLabel"));

// SQL statement to get the monthly revenues for the selected year.
String SQL = "Select Software, Hardware, Services From revenue Where Year(TimeStamp) = " +
    selectedYear + " Order By TimeStamp";

//
// Connect to database and read the query result into arrays
//

// In this example, we use an MS Access database through an ODBC driver.
String dbFile = new java.io.File(application.getRealPath(request.getServletPath())
    ).getParent() + "/sample.mdb";

// Connect to database and prepare the query
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
java.sql.Connection dbConn = java.sql.DriverManager.getConnection
    ("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + dbFile);
java.sql.PreparedStatement stmt = dbConn.prepareStatement(SQL);

// Execute the query and read the results into arrays
DBTable table = new DBTable(stmt.executeQuery());
double[] software = table.getCol(0);
double[] hardware = table.getCol(1);
double[] services = table.getCol(2);

stmt.close();
dbConn.close();

//
// Now we have read data into arrays, we can draw the chart using ChartDirector
//

// Create a XYChart object of size 600 x 360 pixels
XYChart c = new XYChart(600, 360);

// Set the plotarea at (60, 50) and of size 480 x 270 pixels. Use a vertical gradient color from
// light blue (eeeeff) to deep blue (0000cc) as background. Set border and grid lines to white
// (ffffff).
c.setPlotArea(60, 50, 480, 270, c.linearGradientColor(60, 50, 60, 270, 0xeeeeff, 0x0000cc), -1,
    0xffffff, 0xffffff);

// Add a title to the chart using 15pt Times Bold Italic font
c.addTitle("Global Revenue for Year " + selectedYear, "Times New Roman Bold Italic", 18);

// Add a legend box at (60, 25) (top of the plotarea) with 9pt Arial Bold font
c.addLegend(60, 25, false, "Arial Bold", 9).setBackground(Chart.Transparent);

// Add a line chart layer using the supplied data
LineLayer layer = c.addLineLayer2();
layer.addDataSet(software, 0xffaa00, "Software").setDataSymbol(Chart.CircleShape, 9);
layer.addDataSet(hardware, 0x00ff00, "Hardware").setDataSymbol(Chart.DiamondShape, 11);
layer.addDataSet(services, 0xff0000, "Services").setDataSymbol(Chart.Cross2Shape(), 11);

// Set the line width to 3 pixels
layer.setLineWidth(3);

// Set the x axis labels. In this example, the labels must be Jan - Dec.
String[] labels = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov",
    "Dec"};
c.xAxis().setLabels(labels);

// Set y-axis tick density to 30 pixels. ChartDirector auto-scaling will use this as the guideline
// when putting ticks on the y-axis.
c.yAxis().setTickDensity(30);

// Synchronize the left and right y-axes
c.syncYAxis();

// Set the y axes titles with 10pt Arial Bold font
c.yAxis().setTitle("USD (Millions)", "Arial Bold", 10);
c.yAxis2().setTitle("USD (Millions)", "Arial Bold", 10);

// Set all axes to transparent
c.xAxis().setColors(Chart.Transparent);
c.yAxis().setColors(Chart.Transparent);
c.yAxis2().setColors(Chart.Transparent);

// Set the label styles of all axes to 8pt Arial Bold font
c.xAxis().setLabelStyle("Arial Bold", 8);
c.yAxis().setLabelStyle("Arial Bold", 8);
c.yAxis2().setLabelStyle("Arial Bold", 8);

// Create the image and save it in a temporary location
String chart1URL = c.makeSession(request, "chart1");

// Create an image map for the chart
String imageMap1 = c.getHTMLImageMap("xystub.jsp", "",
    "title='{dataSetName} @ {xLabel} = USD {value|0}M'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Database Clickable Charts
</div>
<hr style="border:solid 1px #000080" />
<div style="font-size:10pt; font-family:verdana; width:600px; margin-bottom:20px">
    You have click the bar for the year <%=selectedYear%>.
    Below is the "drill-down" chart showing the monthly details.
<br /><br />
<a href='viewsource.jsp?file=<%=request.getServletPath()%>'>
    View source code
</a>
</div>

<img src="<%=response.encodeURL("getchart.jsp?"+chart1URL)%>" border="0" usemap="#map1">
<map name="map1">
<%=imageMap1%>
</map>

</body>
</html>
