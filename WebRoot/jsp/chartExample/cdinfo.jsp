<%@page import="ChartDirector.*" %>
<%!
static String replace(String str, String target, String replacement) 
{
    String ret = "";
    int leftPos = 0;
    int rightPos;
    while ((rightPos = str.indexOf(target, leftPos)) >= 0)
    {
        ret += str.substring(leftPos, rightPos);
        ret += replacement;
        leftPos = rightPos + target.length();
    }

    return ret + str.substring(leftPos);
}
%>
<html>
<body topmargin="0" leftmargin="0" rightmargin="0" marginwidth="0" marginheight="0">
<div style="margin:5;">
<div style="font-family:verdana; font-weight:bold; font-size:18pt;">
ChartDirector Information
</div>
<hr color="#000080">
<div style="font-family:verdana; font-size:10pt;">
<ul style="margin-top:0; list-style:square; font-family:verdana; font-size:10pt;">
<li>Description : <%=Chart.getDescription()%><br><br>
<li>Version : <%=(Chart.getVersion() & 0xff000000) / 0x1000000%>.<%=(Chart.getVersion() & 0xff0000) / 0x10000%>.<%=Chart.getVersion() & 0xffff%><br><br>
<li>Copyright : <%=Chart.getCopyright()%><br><br>
<li>Boot Log : <br><ul><li><%=replace(Chart.getBootLog().trim(), "\n", "<li>")%></ul><br>
<li>Font Loading Test : <br><ul><li><%=replace(Chart.libgTTFTest(), "\n", "<li>")%></ul>
</ul>
</div>
</body>
</html>
