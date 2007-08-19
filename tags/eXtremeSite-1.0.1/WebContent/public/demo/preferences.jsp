<%@ taglib uri="/tld/extremecomponents" prefix="ec" %>

<%@ taglib uri="/tld/c" prefix="c" %>

<html>

<head>
	<title>eXtremeComponents</title>
</head>

<body>

	<ul id="tabmenu">
		<li><a href="<c:url value="/index.jsp"/>">Home</a></li>
		<li><a class="active" href="<c:url value="/public/demo/examples.jsp"/>">Examples</a></li>
		<li><a href="<c:url value="/public/documentation.jsp"/>">Documentation</a></li>
	</ul>
	
	<div id="content">

	<span class="title">Preferences</span>

	<p>
		By using the Preferences feature you can clean up your tables quite a bit. I will
		first show you a table that does not use the Preferences, and then what that
		same table looks like after introducing the Preferences.
	</p>
	
	<br/>

	<ec:table 
		tableId="pres1"
		items="presidents" 
		action="${pageContext.request.contextPath}/preferences.run" 
		imagePath="${pageContext.request.contextPath}/images/table/*.gif"
		title="Table Without Using Preferences"
		rowsDisplayed="8"
		width="700px"
		>
		<ec:row>
			<ec:column property="fullName" title="Name"/>
			<ec:column property="nickName" />
			<ec:column property="born" cell="date" parse="yyyy-MM-dd" format="MM/dd/yyyy"/>
			<ec:column property="term" />
		</ec:row>
	</ec:table>
	
	
	<br/>

	<p>
		The table is defined like this:
	</p>
		
<pre>
&lt;ec:table 
    items="presidents" 
    action="${pageContext.request.contextPath}/preferences.run" 
    <b>imagePath="${pageContext.request.contextPath}/images/table/*.gif"</b>
    title="Table Without Using Preferences"
    <b>rowsDisplayed="8"</b>
    &gt;
    &lt;ec:row&gt;
        &lt;ec:column property="fullName" title="Name"/&gt;
        &lt;ec:column property="nickName" /&gt;
        &lt;ec:column property="born" cell="date" <b>parse="yyyy-MM-dd"</b> <b>format="MM/dd/yyyy"</b>/&gt;
        &lt;ec:column property="term" /&gt;
    &lt;/ec:row&gt;
&lt;/ec:table&gt;
</pre>		

	<br/>
	
	<p>
		So, lets clean this up some. There are quite a few attributes that we can default
		globally across all eXtremeTables. Place the following name/value pairs in the Preferences, 
		replacing /extremesite with your project context.
		<br/>
	</p>

<pre >
table.imagePath=/extremesite/images/table/*.gif
table.rowsDisplayed=8
table.parse.date=yyyy-MM-dd
table.format.date=MM/dd/yyyy
</pre>		

	<br/>

	<ec:table 
		tableId="pres2"
		items="presidents" 
		action="${pageContext.request.contextPath}/preferences.run" 
		title="Table Using Preferences"
		rowsDisplayed="8"
		width="700px"
		>
		<ec:row>
			<ec:column property="fullName" title="Name"/>
			<ec:column property="nickName" />
			<ec:column property="born" cell="date"/>
			<ec:column property="term" />
		</ec:row>		
	</ec:table>
	
	<br/>

	<p>
		So now we are just down to this:
	</p>
		
<pre >
&lt;ec:table 
    items="presidents2" 
    action="${pageContext.request.contextPath}/preferences.run" 
    title="Table Using Preferences"
    &gt;
    &lt;ec:row&gt;
        &lt;ec:column property="fullName" title="Name"/&gt;
        &lt;ec:column property="nickName" /&gt;
        &lt;ec:column property="born" cell="date"/&gt;
        &lt;ec:column property="term" /&gt;
    &lt;/ec:row&gt;
&lt;/ec:table&gt;
</pre>		
	
	<p>
		We effectively got rid of the imagePath, rowsDisplayed, parse and format attributes.
		Although if you need to override the global attributes you can define them on the table directly yet.
	</p>
	
	</div>	
	
</body>

</html>
	
	