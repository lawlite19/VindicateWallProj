<%@page import="ChartDirector.*" %>
<%
// The data for the pie chart
double[] data = {25, 18, 15, 12, 8, 30, 35};

// The labels for the pie chart
String[] labels = {"Labor", "Licenses", "Taxes", "Legal", "Insurance", "Facilities", "Production"};

// Create a PieChart object of size 450 x 270 pixels
PieChart c = new PieChart(450, 270);

// Set the center of the pie at (150, 100) and the radius to 80 pixels
c.setPieSize(150, 135, 100);

// add a legend box where the top left corner is at (330, 50)
c.addLegend(330, 60);

// modify the sector label format to show percentages only
c.setLabelFormat("{percent}%");

// Set the pie data and the pie labels
c.setData(data, labels);

// Use rounded edge shading, with a 1 pixel white (FFFFFF) border
c.setSectorStyle(Chart.RoundedEdgeShading, 0xffffff, 1);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{label}: US${value}K ({percent}%)'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Pie Chart with Legend (1)
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

