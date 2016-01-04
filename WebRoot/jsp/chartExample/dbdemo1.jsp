<%@page import="ChartDirector.*" %>
<%
// The currently selected year
int selectedYear = (request.getParameter("year") == null) ? 2001 :
    Integer.parseInt(request.getParameter("year"));

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

// Create a XYChart object of size 600 x 300 pixels, with a light grey (eeeeee) background, black
// border, 1 pixel 3D border effect and rounded corners.
XYChart c = new XYChart(600, 300, 0xeeeeee, 0x000000, 1);
c.setRoundedFrame();

// Set the plotarea at (60, 60) and of size 520 x 200 pixels. Set background color to white (ffffff)
// and border and grid colors to grey (cccccc)
c.setPlotArea(60, 60, 520, 200, 0xffffff, -1, 0xcccccc, 0xccccccc);

// Add a title to the chart using 15pt Times Bold Italic font, with a light blue (ccccff) background
// and with glass lighting effects.
c.addTitle("Global Revenue for Year " + selectedYear, "Times New Roman Bold Italic", 15
    ).setBackground(0xccccff, 0x000000, Chart.glassEffect());

// Add a legend box at (70, 32) (top of the plotarea) with 9pt Arial Bold font
c.addLegend(70, 32, false, "Arial Bold", 9).setBackground(Chart.Transparent);

// Add a stacked bar chart layer using the supplied data
BarLayer layer = c.addBarLayer2(Chart.Stack);
layer.addDataSet(software, 0xff0000, "Software");
layer.addDataSet(hardware, 0x00ff00, "Hardware");
layer.addDataSet(services, 0xffaa00, "Services");

// Use soft lighting effect with light direction from the left
layer.setBorderColor(Chart.Transparent, Chart.softLighting(Chart.Left));

// Set the x axis labels. In this example, the labels must be Jan - Dec.
String[] labels = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov",
    "Dec"};
c.xAxis().setLabels(labels);

// Draw the ticks between label positions (instead of at label positions)
c.xAxis().setTickOffset(0.5);

// Set the y axis title
c.yAxis().setTitle("USD (Millions)");

// Set axes width to 2 pixels
c.xAxis().setWidth(2);
c.yAxis().setWidth(2);

// Output the chart in PNG format
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "",
    "title='{dataSetName} Revenue for {xLabel} = USD {value}M'");

//
// The following code generates the <option> tags for the HTML select box, with the <option> tag
// representing the currently selected year marked as selected.
//

StringBuffer selectYearOptions = new StringBuffer();
for (int i = 1990; i <= 2001; ++i)
{
    selectYearOptions.append("<option value='" + i + "'");
    if (i == selectedYear)
        selectYearOptions.append(" selected");
    selectYearOptions.append(">" + i + "</option>");
}
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Database Integration Demo (1)
</div>
<hr style="border:solid 1px #000080" />
<div style="font-size:10pt; font-family:verdana; margin-bottom:20px">
<a href='viewsource.jsp?file=<%=request.getServletPath()%>'>
    View Source Code
</a>
<br />
<br />
<form>
    I want to obtain the revenue data for the year
    <select name="year">
        <%=selectYearOptions.toString()%>
    </select>
    <input type="submit" value="OK">
</form>
</div>

<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'
    usemap="#map1" border="0">
<map name="map1"><%=imageMap1%></map>

</body>
</html>
