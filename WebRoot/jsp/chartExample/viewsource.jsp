<% 
String filename = request.getParameter("file"); 
if (filename.charAt(0) != '/')
{
	String currentPath = request.getServletPath();
	filename = currentPath.substring(0, currentPath.lastIndexOf('/') + 1) + filename;
}
%>
<html>
<body topmargin="0" leftmargin="5" rightmargin="0" marginwidth="5" marginheight="0">
<p style="margin-bottom:5px"><font size="4" face="Verdana"><b><%=filename%></b></font></p>
<a href="javascript:history.go(-1);"><font size="2" face="Verdana">Back to Chart Graphics</font></a>
<xmp><%
java.io.InputStream input = null;
try { input = getServletConfig().getServletContext().getResourceAsStream(filename); }
catch (LinkageError e) { /* some old server may not have getResourceAsStream */ }

if (input == null)
{
	//try traditional method
	String realPath = getServletConfig().getServletContext().getRealPath(filename);
	if (realPath != null)
	{
		try { input = new java.io.FileInputStream(realPath); }
		catch (java.io.IOException e) { /* do nothing */ }
	}
}

if (input == null) 
{
	out.write("Cannot open " + filename + ".");
} 
else 
{
	java.io.BufferedInputStream b = new java.io.BufferedInputStream(input);
	int c;
	while ((c = input.read()) != -1)
		out.write((char)c);
	b.close();
	input.close();
}
%></xmp>
</body>
</html>
