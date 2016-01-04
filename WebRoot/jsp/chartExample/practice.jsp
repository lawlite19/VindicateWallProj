<%@page import="ChartDirector.*" %>   
<%   
// The data for the line chart   
double[] data0 = {42, 49, 33, 38, 51, 46, 29, 41, 44, 57, 59, 52, 37, 34, 51, 56, 56,   
    60, 70, 76, 63, 67, 75, 64, 51};   
double[] data1 = {50, 55, 47, 34, 42, 49, 63, 62, 73, 59, 56, 50, 64, 60, 67, 67, 58,   
    59, 73, 77, 84, 82, 80, 84, 98};   
double[] data2 = {36, 28, 25, 33, 38, 20, 22, 30, 25, 33, 30, 24, 28, 15, 21, 26, 46,   
    42, 48, 45, 43, 52, 64, 60, 70};   
  
// The labels for the line chart   
String[] labels = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",   
    "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"};   
  
//设置图表的高和宽600*300，背景色为白色   
XYChart c = new XYChart(600, 300, 0xeeeeff, 0x000000, 1);   
c.setRoundedFrame();   
  
//设置绘图领域为(55,58) 大小为520*195    
//背景色为白色 横坐标和纵坐标的网格线颜色   
c.setPlotArea(55, 58, 520, 195, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);   
  
//设置网格上边和标题下边的区域大小为(50, 30)，字横向排列，字体为宋体，大小为9   
c.addLegend(50, 30, false, "Arial Bold", 9).setBackground(0xccccff);
  
//设置标题的内容，字体，颜色   
c.addTitle("Application Server Throughput", "Times New Roman Bold Italic", 15  
    ).setBackground(0xccccff, 0x000000, Chart.glassEffect());   
  
//设置y轴的标题,字体，大小，颜色   
c.yAxis().setTitle("MBytes per hour");   
  
//设置x轴的标签   
c.xAxis().setLabels(labels);   
  
//设置x轴显示数据的跨度   
c.xAxis().setLabelStep(3);   
  
//设置x轴标题,字体，大小，颜色   
c.xAxis().setTitle("Jun 12, 2006");   
  
// Add a line layer to the chart   
LineLayer layer = c.addLineLayer2();   
  
//设置线的宽度2   
layer.setLineWidth(2);   
  
//填写数据，设置线的颜色   
layer.addDataSet(data0, 0xff0000, "Server #1");   
layer.addDataSet(data1, 0x008800, "Server #2");   
layer.addDataSet(data2, c.dashLineColor(0x3333ff, Chart.DashLine), "Server #3");   
  
//输出图表   
String chart1URL = c.makeSession(request, "chart1");   
  
// Include tool tip for the chart   
String imageMap1 = c.getHTMLImageMap("", "",   
    "title='[{dataSetName}] Hour {xLabel}: {value} MBytes'");   
%>   
<html>   
<body topmargin="5" leftmargin="5" rightmargin="0">   
<div style="font-size:18pt; font-family:verdana; font-weight:bold">   
    Multi-Line Chart   
</div>   
<hr color="#000080">   
<a href="viewsource.jsp?file=<%=request.getServletPath()%>">   
    <font size="2" face="Verdana">View Chart Source Code</font>   
</a>   
</div>   
<br>   
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'  
    usemap="#map1" border="0">   
<map name="map1"><%=imageMap1%></map>   
</body>   
</html>