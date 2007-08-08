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

	<c:if test="${!empty param.userName}">
	Hi, <c:out value="${param.userName}"/>!
	</c:if>
	<p>You selected the following presidents:</p>
	
	<ec:table
		action="${pageContext.request.contextPath}/public/demo/selectedPresidentsListed.jsp"
		items="selected" 
		showPagination="false"
		showExports="false"
		filterable="false"
		sortable="false"
		autoIncludeParameters="false"
		>
		
		<ec:row>
			<ec:column property="fullName" title="Name"/>
			<ec:column property="nickName" />
			<ec:column property="term" />
		</ec:row>
		
	</ec:table>
		
	<p>
		<a href="<c:url value="/selectedPresidentsController.run?userName=${param.userName}"/>">
			back to example
		</a>
	</p>
	
	<br/>
		
	<p>
		Below is the code that generates the above display.	
	</p>

	<pre>
  &lt;ec:table 
      items="selected" 
      showPagination="false"
      showExports="false"
      filterable="false"
      sortable="false"
      autoIncludeParameters="false"
      &gt;
        &lt;ec:row&gt;
           &lt;ec:column property="fullName" title="Name"/&gt;
           &lt;ec:column property="nickName" /&gt;
           &lt;ec:column property="term" /&gt;
        &lt;/ec:row&gt;
  &lt;/ec:table&gt;</pre>

	</div>	

</body>

</html>

	