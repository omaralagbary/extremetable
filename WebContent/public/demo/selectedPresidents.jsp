<%@ taglib uri="/tld/extremecomponents" prefix="ec" %>
<%@ taglib uri="/tld/c" prefix="c" %>

<html>

<head>
	<title>eXtremeComponents</title>
	<script type="text/javascript" src="<c:url value="/js/extremecomponents.js"/>"></script>
</head>

<body>

	<ul id="tabmenu">
		<li><a href="<c:url value="/index.jsp"/>">Home</a></li>
		<li><a class="active" href="<c:url value="/public/demo/examples.jsp"/>">Examples</a></li>
		<li><a href="<c:url value="/public/documentation.jsp"/>">Documentation</a></li>
	</ul>
	
	<div id="content">

	<span class="title">Custom Form</span>

	<p>
		In this example what you will notice is that the state of the checkboxes are maintained
		while sorting, filtering, and paging. Then when you press the List Selected Presidents
		button you are taken through a different action to see the results.
	
	</p>
	
	<br/>

	<form 
		id="presForm" 
		action="<c:url value="selectedPresidentsListedController.run"/>" 
		method="post"
		>
	
	<div>
	<span>Enter your name:</span>
	<span>
	<input 
		type="text" 
		name="userName" 
		style="font-family:verdana,arial,helvetica,sans-serif;font-size:11px;"
		value="<c:out value="${param.userName}"/>"
		/>
	</span>
	</div>

	<ec:table 
		items="presidents"
		action="${pageContext.request.contextPath}/selectedPresidentsController.run"
		view="compact"
		imagePath="${pageContext.request.contextPath}/images/table/compact/*.gif"
		autoIncludeParameters="false"
		form="presForm"
		width="700px"
		>
		<ec:exportPdf 
			fileName="output.pdf" 
			tooltip="Export PDF" 
			headerColor="black" 
			headerBackgroundColor="#b6c2da" 
			headerTitle="Presidents"
			/>
		<ec:row>
			<ec:column 
				alias="checkbox"
				title=" " 
				filterable="false" 
				sortable="false" 
				viewsAllowed="compact"
				cell="selectedPresident"
				style="width:5px"
				/>
			<ec:column property="fullName" title="Name"/>
			<ec:column property="nickName"/>
			<ec:column property="term"/>
		</ec:row>
	</ec:table>
	
	<p>
		<input
	       type="button"
	       name="sel"
	       class="button"
	       value="List Selected Presidents"
	       onclick="setFormAction('presForm','<c:url value="selectedPresidentsListedController.run"/>', 'post');document.forms.presForm.submit();"
	       />
	</p>

     <script type="text/javascript">
			function setPresidentState(chkbx) {
				//make sure that always know the state of the checkbox
				if (chkbx.checked) {
					eval('document.forms.presForm.chkbx_' + chkbx.name).value='SELECTED';
				} else {
					eval('document.forms.presForm.chkbx_' + chkbx.name).value='UNSELECTED';
				}
			}
     </script>

	</form>
	
	<br/>
	
	<p>
		Below is the code that generates the above display.	
	</p>
		
<pre>
 <b>&lt;form id="presForm" action="<c:url value="selectedPresidentsListedController.run"/>" method="post"&gt;</b>

    &lt;ec:table 
       items="presidents"
       action="${pageContext.request.contextPath}/selectedPresidentsController.run"  
       view="compact"
       imagePath="${pageContext.request.contextPath}/images/table/compact/*.gif"
       autoIncludeParameters="false"
       <b>form="presForm"</b>
       &gt;
       &lt;ec:exportPdf 
           fileName="output.pdf" 
           tooltip="Export PDF" 
           headerColor="black" 
           headerBackgroundColor="#b6c2da" 
           headerTitle="Presidents"/&gt;
         &lt;ec:row&gt;
             &lt;ec:column 
                 alias="checkbox"
                 title=" " 
                 style="width:5px" 
                 filterable="false" 
                 sortable="false" 
                 cell="selectedPresident"
                 /&gt;
             &lt;ec:column property="fullName" title="Name"/&gt;
             &lt;ec:column property="nickName" /&gt;
             &lt;ec:column property="term" /&gt;
         &lt;/ec:row&gt;
    &lt;/ec:table&gt;
	
    <b>&lt;input
       type="button"
       name="sel"
       class="button"
       value="List Selected Presidents"
       onclick="document.forms.presForm.submit();"
       /&gt;

       &lt;script type="text/javascript"&gt;
            function setPresidentState(chkbx) {
                //make sure that always know the state of the checkbox
                if (chkbx.checked) {
                   eval('document.forms.presForm.chkbx_' + chkbx.name).value='SELECTED';
                } else {
                   eval('document.forms.presForm.chkbx_' + chkbx.name).value='UNSELECTED';
                }
             }
       &lt;/script&gt;</b>

 &lt;<b>/form&gt;</b>
</pre>	

	</div>	

</body>

</html>
