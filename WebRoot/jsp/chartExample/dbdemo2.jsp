<%@page import="ChartDirector.*, java.util.*"%>
<%!
// A simple structure to represent a chart image with an image map
private static class ImageWithHotSpot
{
    String imageURL;
    String imageMap;
}

//
// Create the first chart based on the given data
//
private ImageWithHotSpot createChart1(HttpServletRequest request, int selectedYear,
    double[] software, double[] hardware, double[] services)
{
    // Create a XYChart object of size 600 x 300 pixels, with a light grey (eeeeee) background,
    // black border, 1 pixel 3D border effect and rounded corners.
    XYChart c = new XYChart(600, 300, 0xeeeeee, 0x000000, 1);
    c.setRoundedFrame();

    // Set the plotarea at (60, 60) and of size 520 x 200 pixels. Set background color to white
    // (ffffff) and border and grid colors to grey (cccccc)
    c.setPlotArea(60, 60, 520, 200, 0xffffff, -1, 0xcccccc, 0xccccccc);

    // Add a title to the chart using 15pt Times Bold Italic font, with a light blue (ccccff)
    // background and with glass lighting effects.
    c.addTitle("Global Revenue for Year " + selectedYear, "Times New Roman Bold Italic", 15
        ).setBackground(0xccccff, 0x000000, Chart.glassEffect());

    // Add a legend box at (70, 32) (top of the plotarea) with 9pt Arial Bold font
    c.addLegend(70, 32, false, "Arial Bold", 9).setBackground(Chart.Transparent);

    // Add a line chart layer using the supplied data
    LineLayer layer = c.addLineLayer2();
    layer.addDataSet(software, 0xff0000, "Software").setDataSymbol(Chart.CircleShape, 9);
    layer.addDataSet(hardware, 0x00ff00, "Hardware").setDataSymbol(Chart.DiamondShape, 11);
    layer.addDataSet(services, 0xffaa00, "Services").setDataSymbol(Chart.Cross2Shape(), 11);

    // Set the line width to 3 pixels
    layer.setLineWidth(3);

    // Set the x axis labels. In this example, the labels must be Jan - Dec.
    String[] labels = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov",
        "Dec"};
    c.xAxis().setLabels(labels);

    // Set the y axis title
    c.yAxis().setTitle("USD (Millions)");

    // Set axes width to 2 pixels
    c.xAxis().setWidth(2);
    c.yAxis().setWidth(2);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart1");

    // Include tool tip for the chart
    ret.imageMap = c.getHTMLImageMap("", "",
        "title='{dataSetName} Revenue for {xLabel} = USD {value}M'");
    return ret;
}

//
// Create the second chart based on the given data
//
private ImageWithHotSpot createChart2(HttpServletRequest request, int selectedYear,
    double[] software, double[] hardware, double[] services)
{
    // Create a XYChart object of size 600 x 300 pixels, with a light grey (eeeeee) background,
    // black border, 1 pixel 3D border effect and rounded corners.
    XYChart c = new XYChart(600, 300, 0xeeeeee, 0x000000, 1);
    c.setRoundedFrame();

    // Set the plotarea at (60, 60) and of size 520 x 200 pixels. Set background color to white
    // (ffffff) and border and grid colors to grey (cccccc)
    c.setPlotArea(60, 60, 520, 200, 0xffffff, -1, 0xcccccc, 0xccccccc);

    // Add a title to the chart using 15pt Times Bold Italic font, with a dark green (006600)
    // background and with glass lighting effects.
    c.addTitle("Global Revenue for Year " + selectedYear, "Times New Roman Bold Italic", 15,
        0xffffff).setBackground(0x006600, 0x000000, Chart.glassEffect(Chart.ReducedGlare));

    // Add a legend box at (70, 32) (top of the plotarea) with 9pt Arial Bold font
    c.addLegend(70, 32, false, "Arial Bold", 9).setBackground(Chart.Transparent);

    // Add a stacked area chart layer using the supplied data
    AreaLayer layer = c.addAreaLayer2(Chart.Stack);
    layer.addDataSet(software, 0x40ff0000, "Software");
    layer.addDataSet(hardware, 0x4000ff00, "Hardware");
    layer.addDataSet(services, 0x40ffaa00, "Services");

    // Set the area border color to the same as the fill color
    layer.setBorderColor(Chart.SameAsMainColor);

    // Set the x axis labels. In this example, the labels must be Jan - Dec.
    String[] labels = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov",
        "Dec"};
    c.xAxis().setLabels(labels);

    // Set the y axis title
    c.yAxis().setTitle("USD (Millions)");

    // Set axes width to 2 pixels
    c.xAxis().setWidth(2);
    c.yAxis().setWidth(2);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart2");

    // Include tool tip for the chart
    ret.imageMap = c.getHTMLImageMap("", "",
        "title='{dataSetName} Revenue for {xLabel} = USD {value}M'");
    return ret;
}
%>
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
// Now we obtained the data into arrays, we can draw the chart using ChartDirector
//

ImageWithHotSpot chart1 = createChart1(request, selectedYear, software, hardware, services);
ImageWithHotSpot chart2 = createChart2(request, selectedYear, software, hardware, services);

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
    Database Integration Demo (2)
</div>
<hr style="border:solid 1px #000080" />
<div style="font-size:10pt; font-family:verdana; width:600px">
<a href='viewsource.jsp?file=<%=request.getServletPath()%>'>
    View Source Code
</a>
<br />
<br />
The example demonstrates creating two charts in the same page using data from a database.
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

<img src='<%=response.encodeURL("getchart.jsp?"+chart1.imageURL)%>'
    usemap="#map1" border="0">
<map name="map1"><%=chart1.imageMap%></map>
<br /><br />
<img src='<%=response.encodeURL("getchart.jsp?"+chart2.imageURL)%>'
    usemap="#map2" border="0">
<map name="map2"><%=chart2.imageMap%></map>
</body>
</html>
