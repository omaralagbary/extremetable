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

	<span class="title">Limit</span>

	<p>
		By just looking at this example you may be wondering what is different 
		between this and the other examples. What is great about this example is that I
		am only retrieving enough records to display the page being displayed using the 
		Limit feature. This is ideal when working with large data sets when retrieving
		everything is no longer an option because of memory and/or performance considerations.
	</p>
	
	<p>
		The tradeoff for the increased efficiency is that you need to handle the filtering,
		sorting, and paging in a custom manner. However, I have created very easy, clear
		hooks into the eXtremeTable to find out what page the user is asking for, how
		they would like to sort, and what the filter criteria is.
	</p>

	<br/>

	<ec:table 
		items="presidents"
		retrieveRowsCallback="limit"
		filterRowsCallback="limit"
		sortRowsCallback="limit"
		view="limit"
		action="${pageContext.request.contextPath}/limit.run" 
		title="Presidents"
		width="700px"
		>
		<ec:exportXls
			fileName="output.xls" 
			tooltip="Export Excel"
			/>
		<ec:row>
			<ec:column property="fullName" title="Name"/>
			<ec:column property="nickName" />
			<ec:column property="term" />
			<ec:column property="died" cell="date" filterable="false"/>
			<ec:column property="career" />
		</ec:row>
	</ec:table>
	
	<p>
		**In this example the export is limited to return a maximum of 25 rows.
		<br/>
		**Also notice how the custom view has taken the last page navigation off the toolbar.
	</p>
	
	<br/>
	
	<p>
		Below is the code that generates the above display.	
	</p>
		
<pre>
&lt;ec:table 
       items="presidents" 
       <b>retrieveRowsCallback="limit"</b>
       <b>filterRowsCallback="limit"</b>
       <b>sortRowsCallback="limit"</b>
       <b>view="limit"</b>
       action="${pageContext.request.contextPath}/limit.run" 
       title="Presidents"&gt;
    &lt;ec:exportXls
        fileName="output.xls" 
        tooltip="Export Excel"
        /&gt;
    &lt;ec:row&gt;
        &lt;ec:column property="fullName" title="Name"/&gt;
        &lt;ec:column property="nickName" /&gt;
        &lt;ec:column property="term" /&gt;
        &lt;ec:column property="born" cell="date" filterable="false"/&gt;
        &lt;ec:column property="died" cell="date" filterable="false"/&gt;
        &lt;ec:column property="career" /&gt;
    &lt;/ec:row&gt;
&lt;/ec:table&gt;
</pre>	

	</div>	
	
</body>

</html>
	
	
