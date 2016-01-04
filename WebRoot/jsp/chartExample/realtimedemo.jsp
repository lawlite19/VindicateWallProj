<!DOCTYPE html>
<html>
<head>
    <title>Simple Realtime Chart</title>
    <script type="text/javascript" src="cdjcv.js"></script>
</head>
<body style="margin:0px">
<table cellspacing="0" cellpadding="0" border="0">
    <tr>
        <td align="right" colspan="2" style="background:#000088; color:#ffff00; padding:0px 4px 2px 0px;">
            <a style="color:#FFFF00; font:italic bold 10pt Arial; text-decoration:none" href="http://www.advsofteng.com/">
                Advanced Software Engineering
            </a>
        </td>
    </tr>
    <tr valign="top">
        <td style="width:130px; background:#c0c0ff; border-right:black 1px solid; border-bottom:black 1px solid;">
            <br />
            <br />
            <div style="font:12px Verdana; padding:10px;">
                <b>Update Period</b><br />
                <select id="UpdatePeriod" style="width:110px">
                    <option value="5">5</option>
                    <option value="10" selected="selected">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                    <option value="60">60</option>
                </select>
                <br /><br /><br />
                <b>Time Remaining</b><br />
                <div style="width:108px; border:#888888 1px inset;">
                    <div style="margin:3px" id="TimeRemaining">0</div>
                </div>
            </div>
        </td>
        <td>
            <div style="font: bold 20pt Arial; margin:5px 0px 0px 5px;">
                Simple Realtime Chart
            </div>
            <hr style="border:solid 1px #000080" />
            <div style="padding:0px 5px 5px 10px">
                <!-- ****** Here is the image tag for the chart image ****** -->
                <img id="ChartImage1" src="realtimechart.jsp?chartId=demoChart1">
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">

//
// Executes once every second to update the countdown display. Updates the chart when the countdown reaches 0.
//
function timerTick()
{
    // Get the update period and the time left
    var updatePeriod = parseInt(document.getElementById("UpdatePeriod").value);
    var timeLeft = Math.min(parseInt(document.getElementById("TimeRemaining").innerHTML), updatePeriod) - 1;

    if (timeLeft == 0)
        // Can update the chart now
        JsChartViewer.get('ChartImage1').streamUpdate();
    else if (timeLeft < 0)
        // Reset the update period
        timeLeft += updatePeriod;

    // Update the countdown display
    document.getElementById("TimeRemaining").innerHTML = timeLeft;
}
window.setInterval("timerTick()", 1000);

</script>
</body>
</html>
