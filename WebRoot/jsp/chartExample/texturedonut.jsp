<%@page import="ChartDirector.*" %>
<%
// The data for the pie chart
double[] data = {18, 45, 28};

// The labels for the pie chart
String[] labels = {"Marble", "Wood", "Granite"};

// The icons for the sectors
String[] texture = {"marble3.png", "wood.png", "rock.png"};

// Create a PieChart object of size 400 x 330 pixels, with a metallic green (88EE88) background,
// black border and 1 pixel 3D border effect
PieChart c = new PieChart(400, 330, Chart.metalColor(0x88ee88), 0x000000, 1);

//Set search path to current JSP directory for loading icon images
c.setSearchPath(getServletConfig().getServletContext(), request);

// Set donut center at (200, 160), and outer/inner radii as 120/60 pixels
c.setDonutSize(200, 160, 120, 60);

// Add a title box using 15pt Times Bold Italic font and metallic deep green (008000) background
// color
c.addTitle("Material Composition", "Times New Roman Bold Italic", 15).setBackground(
    Chart.metalColor(0x008000));

// Set the pie data and the pie labels
c.setData(data, labels);

// Set the colors of the sectors to the 3 texture patterns
c.setColor(Chart.DataColor + 0, c.patternColor2(texture[0]));
c.setColor(Chart.DataColor + 1, c.patternColor2(texture[1]));
c.setColor(Chart.DataColor + 2, c.patternColor2(texture[2]));

// Draw the pie in 3D with a 3D depth of 30 pixels
c.set3D(30);

// Use 12pt Arial Bold Italic as the sector label font
c.setLabelStyle("Arial Bold Italic", 12);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{label}: {value}kg ({percent}%)'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Texture Donut Chart
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

