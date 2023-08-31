<%@page import="org.w3c.dom.css.CSSValueList"%>
<%@ page language="java" import="java.util.*,hpharmacy.PharmacyRecord"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%
ArrayList<PharmacyRecord> pr = (ArrayList<PharmacyRecord>)request.getAttribute("adata");
System.out.println(pr.size()+"nsvdn");
%>
<body>
	<center>
		<h1>Medicines Available</h1>
		<input type="text" id="search1">
		<button onclick="seaa()">Search</button>
		<br></br> <select id="medicine">
			<option>Select</option>
		</select>
		<a href="#"><button onclick="dooo()">Done</button></a>
	</center>
	<script type="text/javascript">
		var sel=document.getElementById("medicine");
		<%
		for(PharmacyRecord pp:pr){
	%>
	var opt=document.createElement("option");
	opt.textContent="<%=pp.getMedicine()%>";
	sel.appendChild(opt);
	<%}%>
	function seaa(){
		var vall= document.getElementById("search1").value;
			for(var i=0;i<sel.options.length;i++){
				console.log(i);
				if (!sel.options[i].textContent.includes(vall)) {
					sel.removeChild(sel.options[i]);
					i--;
				}
			}
	}
	function dooo(){
		var selll=document.getElementById("medicine").value;
		sessionStorage.setItem('username', 'john_doe');
		window.location.href="first1?mname="+selll;
		
	}
	</script>
	<br></br>
	
</body>
</html>