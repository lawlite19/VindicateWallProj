<%@page import="ChartDirector.*, java.util.*"%>
<%!
//
// Initialize the WebChartViewer when the page is first loaded
//
private void initViewer(WebChartViewer viewer)
{
    // The full x-axis range is from Jan 1, 2007 to Jan 1, 2012
    Date startDate = new GregorianCalendar(2010, 0, 1).getTime();
    Date endDate = new GregorianCalendar(2015, 0, 1).getTime();
    viewer.setFullRange("x", startDate, endDate);

    // Initialize the view port to show the last 366 days (out of 1826 days)
    viewer.setViewPortWidth(366.0 / 1826);
    viewer.setViewPortLeft(1 - viewer.getViewPortWidth());

    // Set the maximum zoom to 10 days (out of 1826 days)
    viewer.setZoomInWidthLimit(10.0 / 1826);
}

//
// Create a random table for demo purpose.
//
private RanTable getRandomTable()
{
    RanTable r = new RanTable(127, 4, 1828);
    r.setDateCol(0, new GregorianCalendar(2010, 0, 1).getTime(), 86400);
    r.setCol(1, 150, -10, 10);
    r.setCol(2, 200, -10, 10);
    r.setCol(3, 250, -8, 8);
    return r;
}

//
// Draw the chart
//
private void drawChart(WebChartViewer viewer)
{
    // Determine the visible x-axis range
    Date viewPortStartDate = Chart.NTime(viewer.getValueAtViewPort("x", viewer.getViewPortLeft()));
    Date viewPortEndDate = Chart.NTime(viewer.getValueAtViewPort("x", viewer.getViewPortLeft() +
        viewer.getViewPortWidth()));

    // We need to get the data within the visible x-axis range. In real code, this can be by using a
    // database query or some other means as specific to the application. In this demo, we just
    // generate a random data table, and then select the data within the table.
    RanTable r = getRandomTable();

    // Select the data for the visible date range viewPortStartDate to viewPortEndDate. It is
    // possible there is no data point at exactly viewPortStartDate or viewPortEndDate. In this
    // case, we also need the data points that are just outside the visible date range to "overdraw"
    // the line a little bit (the "overdrawn" part will be clipped to the plot area) In this demo,
    // we do this by adding a one day margin to the date range when selecting the data.
    r.selectDate(0, new Date(viewPortStartDate.getTime() - 86400000), new Date(
        viewPortEndDate.getTime() + 86400000));

    // The selected data from the random data table
    Date[] timeStamps = Chart.NTime(r.getCol(0));
    double[] dataSeriesA = r.getCol(1);
    double[] dataSeriesB = r.getCol(2);
    double[] dataSeriesC = r.getCol(3);

    //
    // Now we have obtained the data, we can plot the chart.
    //

    //================================================================================
    // Configure overall chart appearance.
    //================================================================================

    // Create an XYChart object of size 640 x 400 pixels
    XYChart c = new XYChart(640, 400);

    // Set the plotarea at (55, 55) with width 80 pixels less than chart width, and height 90 pixels
    // less than chart height. Use a vertical gradient from light blue (f0f6ff) to sky blue (a0c0ff)
    // as background. Set border to transparent and grid lines to white (ffffff).
    c.setPlotArea(55, 55, c.getWidth() - 80, c.getHeight() - 90, c.linearGradientColor(0, 55, 0,
        c.getHeight() - 35, 0xf0f6ff, 0xa0c0ff), -1, Chart.Transparent, 0xffffff, 0xffffff);

    // As the data can lie outside the plotarea in a zoomed chart, we need to enable clipping.
    c.setClipping();

    // Add a title box using dark grey (0x333333) 18pt Arial Bold font
    c.addTitle("   Zooming and Scrolling with Viewport Control", "Arial Bold", 15, 0x333333);

    if (viewer.isAttachmentRequest()) {
        LegendBox b = c.addLegend(55, 28, false, "Arial Bold", 10);
        b.setBackground(Chart.Transparent, Chart.Transparent);
        b.setLineStyleKey();
    }

    // Set the x and y axis stems to transparent and the label font to 10pt Arial
    c.xAxis().setColors(Chart.Transparent);
    c.yAxis().setColors(Chart.Transparent);
    c.xAxis().setLabelStyle("Arial", 10);
    c.yAxis().setLabelStyle("Arial", 10);

    // Add axis title using 10pt Arial Bold font
    c.yAxis().setTitle("Ionic Temperature (C)", "Arial Bold", 10);

    //================================================================================
    // Add data to chart
    //================================================================================

    //
    // In this example, we represent the data by lines. You may modify the code below to use other
    // layer types (areas, scatter plot, etc).
    //

    // Add a line layer for the lines, using a line width of 2 pixels
    LineLayer layer = c.addLineLayer2();
    layer.setLineWidth(2);

    // In this demo, we do not have too many data points. In real code, the chart may contain a lot
    // of data points when fully zoomed out - much more than the number of horizontal pixels in this
    // plot area. So it is a good idea to use fast line mode.
    layer.setFastLineMode();

    // Now we add the 3 data series to a line layer, using the color red (0xff3333), green
    // (0x008800) and blue (0x3333cc)
    layer.setXData(timeStamps);
    layer.addDataSet(dataSeriesA, 0xff3333, "Alpha");
    layer.addDataSet(dataSeriesB, 0x008800, "Beta");
    layer.addDataSet(dataSeriesC, 0x3333cc, "Gamma");

    //================================================================================
    // Configure axis scale and labelling
    //================================================================================

    // Set the x-axis as a date/time axis with the scale according to the view port x range.
    viewer.syncDateAxisWithViewPort("x", c.xAxis());

    // For the automatic y-axis labels, set the minimum spacing to 30 pixels.
    c.yAxis().setTickDensity(30);

    //
    // In this demo, the time range can be from a few years to a few days. We demonstrate how to set
    // up different date/time format based on the time range.
    //

    // If all ticks are yearly aligned, then we use "yyyy" as the label format.
    c.xAxis().setFormatCondition("align", 360 * 86400);
    c.xAxis().setLabelFormat("{value|yyyy}");

    // If all ticks are monthly aligned, then we use "mmm yyyy" in bold font as the first label of a
    // year, and "mmm" for other labels.
    c.xAxis().setFormatCondition("align", 30 * 86400);
    c.xAxis().setMultiFormat(Chart.StartOfYearFilter(), "<*font=bold*>{value|mmm<*br*>yyyy}",
        Chart.AllPassFilter(), "{value|mmm}");

    // If all ticks are daily algined, then we use "mmm dd<*br*>yyyy" in bold font as the first
    // label of a year, and "mmm dd" in bold font as the first label of a month, and "dd" for other
    // labels.
    c.xAxis().setFormatCondition("align", 86400);
    c.xAxis().setMultiFormat(Chart.StartOfYearFilter(),
        "<*block,halign=left*><*font=bold*>{value|mmm dd<*br*>yyyy}", Chart.StartOfMonthFilter(),
        "<*font=bold*>{value|mmm dd}");
    c.xAxis().setMultiFormat2(Chart.AllPassFilter(), "{value|dd}");

    // For all other cases (sub-daily ticks), use "hh:nn<*br*>mmm dd" for the first label of a day,
    // and "hh:nn" for other labels.
    c.xAxis().setFormatCondition("else");
    c.xAxis().setMultiFormat(Chart.StartOfDayFilter(), "<*font=bold*>{value|hh:nn<*br*>mmm dd}",
        Chart.AllPassFilter(), "{value|hh:nn}");

    //================================================================================
    // Step 5 - Output the chart
    //================================================================================

    if (viewer.isAttachmentRequest()) {
        // Output as PDF attachment
        String chartQuery = c.makeSession(viewer.getRequest(), viewer.getId(), Chart.PDF,
            "viewportcontroldemo.pdf", true);

        // Set the chart URL to the viewer
        viewer.setImageUrl("getchart.jsp?" + chartQuery);
    } else {
        // Output the chart
        String chartQuery = c.makeSession(viewer.getRequest(), viewer.getId());

        // Set the chart URL to the viewer
        viewer.setImageUrl("getchart.jsp?" + chartQuery);

        // Output Javascript chart model to the browser to support tracking cursor
        viewer.setChartModel(c.getJsChartModel());
    }
}

private void drawFullChart(WebViewPortControl vp, WebChartViewer viewer)
{
    // We need to draw a small thumbnail chart for the full data range. The simplest method is to
    // simply get the full data to draw the chart. If the full data are very large (eg. millions of
    // points), for such a small thumbnail chart, it is often acceptable to just retreive a small
    // sample of the data.
    //
    // In this example, there are only around 5500 points for the 3 data series. This amount is not
    // large to ChartDirector, so we simply pass all the data to ChartDirector.
    RanTable r = getRandomTable();

    // Get all the data from the random table
    Date[] timeStamps = Chart.NTime(r.getCol(0));
    double[] dataSeriesA = r.getCol(1);
    double[] dataSeriesB = r.getCol(2);
    double[] dataSeriesC = r.getCol(3);

    // Create an XYChart object of size 640 x 60 pixels
    XYChart c = new XYChart(640, 60);

    // Set the plotarea with the same horizontal position as that in the main chart for alignment.
    // The vertical position is set to equal to the chart height.
    c.setPlotArea(55, 0, c.getWidth() - 80, c.getHeight() - 1, 0xc0d8ff, -1, 0x888888,
        Chart.Transparent, 0xffffff);

    // Set the x axis stem to transparent and the label font to 10pt Arial
    c.xAxis().setColors(Chart.Transparent);
    c.xAxis().setLabelStyle("Arial", 10);

    // Put the x-axis labels inside the plot area by setting a negative label gap. Use
    // setLabelAlignment to put the label at the right side of the tick.
    c.xAxis().setLabelGap(-1);
    c.xAxis().setLabelAlignment(1);

    // Set the y axis stem and labels to transparent (that is, hide the labels)
    c.yAxis().setColors(Chart.Transparent, Chart.Transparent);

    // Add a line layer for the lines with fast line mode enabled
    LineLayer layer = c.addLineLayer2();
    layer.setFastLineMode();

    // Now we add the 3 data series to a line layer, using the color red (0xff3333), green
    // (0x008800) and blue (0x3333cc)
    layer.setXData(timeStamps);
    layer.addDataSet(dataSeriesA, 0xff3333);
    layer.addDataSet(dataSeriesB, 0x008800);
    layer.addDataSet(dataSeriesC, 0x3333cc);

    // The x axis scales should reflect the full range of the view port
    c.xAxis().setDateScale(viewer.getValueAtViewPort("x", 0), viewer.getValueAtViewPort("x", 1));

    // For the automatic x-axis labels, set the minimum spacing to 75 pixels.
    c.xAxis().setTickDensity(75);

    // For the auto-scaled y-axis, as we hide the labels, we can disable axis rounding. This can
    // make the axis scale fit the data tighter.
    c.yAxis().setRounding(false, false);

    // Output the chart
    String chartQuery = c.makeSession(vp.getRequest(), vp.getId());

    // Set the chart URL and chart metrics to the viewport control
    vp.setImageUrl("getchart.jsp?" + chartQuery);
    vp.setChartMetrics(c.getChartMetrics());
}
%>
<%

//
// This script handles both the full page request, as well as the subsequent partial updates (AJAX
// chart updates). We need to determine the type of request first before we processing it.
//

// Create the WebChartViewer object
WebChartViewer viewer = new WebChartViewer(request, "chart1");

if (viewer.isPartialUpdateRequest()) {
    // Is a partial update request. Draw the chart and perform a partial response.
    drawChart(viewer);
    if (viewer.isAttachmentRequest()) {
        // Attachment is streamed directly back to the browser
        pageContext.forward(viewer.getImageUrl());
        return;
    }
    out.clear();
    viewer.partialUpdateChart(response);
    return;
}

//
// If the code reaches here, it is a full page request.
//

// Initialize the WebChartViewer and draw the chart.
initViewer(viewer);
drawChart(viewer);

// Create the WebViewPortControl object
WebViewPortControl viewPortCtrl = new WebViewPortControl(request, "fullchart1");
drawFullChart(viewPortCtrl, viewer);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Zooming and Scrolling with Viewport Control</title>
    <script type="text/javascript" src="cdjcv.js"></script>
    <style type="text/css">
        .chartButton { font:12px Verdana; border-bottom:#000000 1px solid; padding:5px; cursor:pointer;}
        .chartButtonSpacer { font:12px Verdana; border-bottom:#000000 1px solid; padding:5px;}
        .chartButton:hover { box-shadow:inset 0px 0px 0px 2px #444488; }
        .chartButtonPressed { background-color: #CCFFCC; }
    </style>
</head>
<body style="margin:0px;">
<script type="text/javascript">

//
// Execute the following initialization code after the web page is loaded
//
JsChartViewer.addEventListener(window, 'load', function() {
    // Update the chart when the view port has changed (eg. when the user zooms in using the mouse)
    var viewer = JsChartViewer.get('<%=viewer.getId()%>');
    viewer.attachHandler("ViewPortChanged", viewer.partialUpdate);

    // Initialize the navigation pad
    JsViewPortControl.get('<%=viewPortCtrl.getId()%>').setViewer(viewer);

    // Draw track cursor when mouse is moving over plotarea or if the chart updates
    viewer.attachHandler(["MouseMovePlotArea", "TouchStartPlotArea", "TouchMovePlotArea", "PostUpdate",
        "Now", "ChartMove"], function(e) {
        this.preventDefault(e);   // Prevent the browser from using touch events for other actions
        trackLineLegend(viewer, viewer.getPlotAreaMouseX());
    });
});

//
// Draw track line with legend
//
function trackLineLegend(viewer, mouseX)
{
    // Remove all previously drawn tracking object
    viewer.hideObj("all");

    // The chart and its plot area
    var c = viewer.getChart();
    var plotArea = c.getPlotArea();

    // Get the data x-value that is nearest to the mouse, and find its pixel coordinate.
    var xValue = c.getNearestXValue(mouseX);
    var xCoor = c.getXCoor(xValue);
    if (xCoor == null)
        return;

    // Draw a vertical track line at the x-position
    viewer.drawVLine("trackLine", xCoor, plotArea.getTopY(), plotArea.getBottomY(), "black 1px dotted");

    // Array to hold the legend entries
    var legendEntries = [];

    // Iterate through all layers to build the legend array
    for (var i = 0; i < c.getLayerCount(); ++i)
    {
        var layer = c.getLayerByZ(i);

        // The data array index of the x-value
        var xIndex = layer.getXIndexOf(xValue);

        // Iterate through all the data sets in the layer
        for (var j = 0; j < layer.getDataSetCount(); ++j)
        {
            var dataSet = layer.getDataSetByZ(j);

            // We are only interested in visible data sets with names, as they are required for legend entries.
            var dataName = dataSet.getDataName();
            var color = dataSet.getDataColor();
            if ((!dataName) || (color == null))
                continue;

            // Build the legend entry, consist of a colored square box, the name and the data value.
            var dataValue = dataSet.getValue(xIndex);
            legendEntries.push("<nobr>" + viewer.htmlRect(10, 10, color) + " " + dataName + ": " +
                ((dataValue == null) ? "N/A" : dataValue.toPrecision(4)) + viewer.htmlRect(20, 0) + "</nobr> ");

            // Draw a track dot for data points within the plot area
            var yCoor = c.getYCoor(dataSet.getPosition(xIndex), dataSet.getUseYAxis());
            if ((yCoor != null) && (yCoor >= plotArea.getTopY()) && (yCoor <= plotArea.getBottomY()))
            {
                viewer.showTextBox("dataPoint" + i + "_" + j, xCoor, yCoor, JsChartViewer.Center,
                    viewer.htmlRect(9, 9, color));
            }
        }
    }

    // Create the legend by joining the legend entries.
    var legend = "<nobr>[" + c.xAxis().getFormattedLabel(xValue, "mm/dd/yyyy") + "]" + viewer.htmlRect(20, 0) +
        "</nobr> " + legendEntries.reverse().join("");

    // Display the legend on the top of the plot area
    viewer.showTextBox("legend", plotArea.getLeftX(), plotArea.getTopY(), JsChartViewer.BottomLeft, legend,
        "padding:0px 0px 3px 3px; font:bold 13px Arial; -webkit-text-size-adjust:100%;");
}

//
// This method is called when the user clicks on the Pointer, Zoom In or Zoom Out buttons
//
function setMouseMode(mode)
{
    var viewer = JsChartViewer.get('<%=viewer.getId()%>');
    if (mode == viewer.getMouseUsage())
        mode = JsChartViewer.Default;

    // Set the button color based on the selected mouse mode
    document.getElementById("scrollButton").className = "chartButton" +
        ((mode  == JsChartViewer.Scroll) ? " chartButtonPressed" : "");
    document.getElementById("zoomInButton").className = "chartButton" +
        ((mode  == JsChartViewer.ZoomIn) ? " chartButtonPressed" : "");
    document.getElementById("zoomOutButton").className = "chartButton" +
        ((mode  == JsChartViewer.ZoomOut) ? " chartButtonPressed" : "");

    // Set the mouse mode
    viewer.setMouseUsage(mode);
}

//
// This method is called when the user clicks on the buttons that selects the last NN days
//
function setTimeRange(duration)
{
    var viewer = JsChartViewer.get('<%=viewer.getId()%>');

    // Set the view port width to represent the required duration (as a ratio to the total x-range)
    viewer.setViewPortWidth(Math.min(1,
        duration / (viewer.getValueAtViewPort("x", 1) - viewer.getValueAtViewPort("x", 0))));

    // Set the view port left so that the view port is moved to show the latest data
    viewer.setViewPortLeft(1 - viewer.getViewPortWidth());

    // Trigger a view port change event
    viewer.raiseViewPortChangedEvent();
}

</script>
<form method="post" id="ZoomScrollTrack" runat="server">
<table cellspacing="0" cellpadding="0" style="border:black 1px solid;">
    <tr>
        <td align="right" colspan="2" style="background:#000088; color:#ffff00; padding:0px 4px 2px 0px;">
            <a style="color:#FFFF00; font:italic bold 10pt Arial; text-decoration:none" href="http://www.advsofteng.com/">
                Advanced Software Engineering
            </a>
        </td>
    </tr>
    <tr valign="top">
        <td style="width:130px; background:#c0c0ff;">
           <div style="width:130px">
            <!-- The following table is to create 3 cells for 3 buttons to control the mouse usage mode. -->
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="chartButton" id="scrollButton" onclick="setMouseMode(JsChartViewer.Scroll)"
                        ontouchstart="this.onclick(event); event.preventDefault();">
                        <img src="scrollew.gif" style="vertical-align:middle" alt="Drag" />&nbsp;&nbsp;Drag to Scroll
                    </td>
                </tr>
                <tr>
                    <td class="chartButton" id="zoomInButton" onclick="setMouseMode(JsChartViewer.ZoomIn)"
                        ontouchstart="this.onclick(event); event.preventDefault();">
                        <img src="zoomInIcon.gif" style="vertical-align:middle" alt="Zoom In" />&nbsp;&nbsp;Zoom In
                    </td>
                </tr>
                <tr>
                    <td class="chartButton" id="zoomOutButton" onclick="setMouseMode(JsChartViewer.ZoomOut)"
                        ontouchstart="this.onclick(event); event.preventDefault();">
                        <img src="zoomOutIcon.gif" style="vertical-align:middle" alt="Zoom Out" />&nbsp;&nbsp;Zoom Out
                    </td>
                </tr>
                <tr>
                    <td class="chartButtonSpacer">
                        <div style="padding:2px">&nbsp;</div>
                    </td>
                </tr>
                <tr>
                    <td class="chartButton" onclick="setTimeRange(30 * 86400);"
                        ontouchstart="this.onclick(event); event.preventDefault();">
                        <img src="goto.gif" style="vertical-align:middle" alt="Last 30 days" />&nbsp;&nbsp;Last 30 days
                    </td>
                </tr>
                <tr>
                    <td class="chartButton" onclick="setTimeRange(90 * 86400);"
                        ontouchstart="this.onclick(event); event.preventDefault();">
                        <img src="goto.gif" style="vertical-align:middle" alt="Last 90 days" />&nbsp;&nbsp;Last 90 days
                    </td>
                </tr>
                <tr>
                    <td class="chartButton" onclick="setTimeRange(366 * 86400);"
                        ontouchstart="this.onclick(event); event.preventDefault();">
                        <img src="goto.gif" style="vertical-align:middle" alt="Last Year" />&nbsp;&nbsp;Last Year
                    </td>
                </tr>
                <tr>
                    <td class="chartButton" onclick="setTimeRange(1E15);"
                        ontouchstart="this.onclick(event); event.preventDefault();">
                        <img src="goto.gif" style="vertical-align:middle" alt="All Time" />&nbsp;&nbsp;All Time
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <div style="text-align:center;">
                <input type="button" value="Download PDF" style="font:13px Arial; width:124px;"
                    onclick="JsChartViewer.get('<%=viewer.getId()%>').partialUpdateAsAttachment();" />
            </div>
        </div>
        </td>
        <td style="border-left:black 1px solid; padding:10px 5px 10px 5px;">
            <!-- ****** Here is the chart image ****** -->
            <%=viewer.renderHTML(response)%><br />
            <!-- ****** Here is the viewport control ****** -->
            <%=viewPortCtrl.renderHTML(response)%>
        </td>
    </tr>
</table>
</form>
</body>
</html>
