<%@page import="ChartDirector.*" %>
<%
// The data for the pyramid chart
double[] data = {156, 123, 211, 179};

// The labels for the pyramid chart
String[] labels = {"Funds", "Bonds", "Stocks", "Cash"};

// Create a PyramidChart object of size 360 x 360 pixels
PyramidChart c = new PyramidChart(360, 360);

// Set the pyramid center at (180, 180), and width x height to 150 x 180 pixels
c.setPyramidSize(180, 180, 150, 300);

// Set the pyramid data and labels
c.setData(data, labels);

// Add labels at the center of the pyramid layers using Arial Bold font. The labels will have two
// lines showing the layer name and percentage.
c.setCenterLabel("{label}\n{percent}%", "Arial Bold");

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{label}: US$ {value}M ({percent}%)'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Simple Pyramid Chart
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

