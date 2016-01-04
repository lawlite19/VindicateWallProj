<%@page import="ChartDirector.*" %>
<%
// Get the selected year and month
int selectedYear = Integer.parseInt(request.getParameter("year"));
int selectedMonth = Integer.parseInt(request.getParameter("x")) + 1;

//
// In real life, the data may come from a database based on selectedYear. In this example, we just
// use a random number generator.
//
int seed = (selectedYear - 1992) * (100 + 3 * selectedMonth);
RanTable rantable = new RanTable(seed, 1, 4);
rantable.setCol(0, seed * 0.003, seed * 0.017);

double[] data = rantable.getCol(0);

// The labels for the pie chart
String[] labels = {"Services", "Hardware", "Software", "Others"};

// Create a PieChart object of size 600 x 240 pixels
PieChart c = new PieChart(600, 280);

// Set the center of the pie at (300, 140) and the radius to 120 pixels
c.setPieSize(300, 140, 120);

// Add a title to the pie chart using 18pt Times Bold Italic font
c.addTitle("Revenue Breakdown for " + selectedMonth + "/" + selectedYear,
    "Times New Roman Bold Italic", 18);

// Draw the pie in 3D with 20 pixels 3D depth
c.set3D(20);

// Set label format to display sector label, value and percentage in two lines
c.setLabelFormat("{label}<*br*>${value|2}M ({percent}%)");

// Set label style to 10pt Arial Bold Italic font. Set background color to the same as the sector
// color, with reduced-glare glass effect and rounded corners.
TextBox t = c.setLabelStyle("Arial Bold Italic", 10);
t.setBackground(Chart.SameAsMainColor, Chart.Transparent, Chart.glassEffect(Chart.ReducedGlare));
t.setRoundedCorners();

// Use side label layout method
c.setLabelLayout(Chart.SideLayout);

// Set the pie data and the pie labels
c.setData(data, labels);

// Create the image and save it in a temporary location
String chart1URL = c.makeSession(request, "chart1");

// Create an image map for the chart
String imageMap1 = c.getHTMLImageMap("piestub.jsp", "", "title='{label}:US$ {value|2}M'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Simple Clickable Pie Chart
</div>
<hr style="border:solid 1px #000080" />
<div style="font-size:10pt; font-family:verdana; margin-bottom:20">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src="<%=response.encodeURL("getchart.jsp?"+chart1URL)%>" border="0" usemap="#map1">
<map name="map1">
<%=imageMap1%>
</map>
</body>
</html>
