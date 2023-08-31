<%@ page language="java" import="java.util.*,hpharmacy.PharmacyRecord"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

h1 {
	color: #333;
}

h2 {
	color: #444;
}

center {
	margin-top: 20px;
}

label {
	display: inline-block;
	margin-right: 10px;
	margin-bottom: 5px;
	color: #555;
}

select, input[type="text"], input[type="date"], button {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: center;
}

th {
	background-color: #333;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

button {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 3px;
	padding: 8px 15px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

input[type="button"] {
	background-color: #ccc;
	color: #333;
	border: none;
	border-radius: 3px;
	padding: 5px 10px;
	cursor: pointer;
}

input[type="button"]:hover {
	background-color: #aaa;
}
</style>
</head>
<%
	ArrayList<PharmacyRecord> pr = (ArrayList<PharmacyRecord>) request.getAttribute("adata");
%>
<body>

	<center>
		<h1>Pharmacy</h1>
		<label>Bill Number :<input type="text" id="bill"></label> <label>Bill
			Date :<input type="date" id="date">
		</label><br></br> <label>Patient Name:<input type="text" id="patient"></label>
		<label>Doctor Name:<input type="text" id="doctor"></label><br></br>
		<h2>Medicine Details</h2>
		<table>
			<thead>
				<th>Serial no</th>
				<th>Medicine_name</th>
				<th>Batch no</th>
				<th>Expire Date</th>
				<th>Medicine_qty</th>
				<th>Medicine_price</th>
				<th>Edit</th>
				<th>Remove</th>
			</thead>
			<tbody id="container">
			</tbody>
		</table>
		` <label>Total Amount :<input type="text" id="total"></label>
		<input type="button" onclick="openForm()" value="Add"> <a
			href="#"><input type="button" onclick="preview()" value="Preview"></a>

<div class="form-popup" id="myForm">
<center>
		<h1>Medicines Available</h1>
		<input type="text" id="search1">
		<button onclick="seaa()">Search</button>
		<br></br> <select id="medicine">
			<option>Select</option>
		</select>
		<a href="#"><button onclick="dooo()">Done</button></a>
	</center>
</div>
          
	</center>
	<script>
		function details() {
			window.open("medicine", "medicines", width=300,height=200);
		}
		
		function openForm() {
			  document.getElementById("myForm").style.display = "block";
			}

			function closeForm() {
			  document.getElementById("myForm").style.display = "none";
			}
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
		
		for (var i = 0; i < sel.options.length; i++) {
				console.log(i);
				if (!sel.options[i].textContent.includes(vall)) {
					sel.removeChild(sel.options[i]);
					i--;
				}
			}
		}
		function dooo() {
			var selll = document.getElementById("medicine").value;
			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'first1?data=' + selll, true);
			xhr.onreadystatechange=function(){
				var data = JSON.parse(xhr.responseText);
				var tbody = document.getElementById('container');
				var trow = document.createElement('tr');
				var tdef1 = document.createElement('td');
				var tdef2 = document.createElement('td');
				var tdef3 = document.createElement('td');
				var tdef4 = document.createElement('td');
				var tdef5 = document.createElement('td');
				var tdef6 = document.createElement('td');
				var tdef7 = document.createElement('td');
				var tdef8 = document.createElement('td');
				var button = document.createElement("button");
				tdef1.textContent=data.serialNumber;
				tdef2.textContent=data.medicine;
				tdef3.textContent=data.batchNumber;
				tdef4.textContent=data.expiryDate;
				tdef5.textContent="";
				tdef6.textContent=data.price;
					button.textContent = "Remove";
					button.addEventListener('click', function() {
						const row = this.parentNode.parentNode;
						row.innerHTML = "";
					})
					var button1 = document.createElement("button");
					button1.textContent = "Edit";
					button1.addEventListener('click', function() {
						const row = this.parentNode.parentNode;
					})
					tdef8.appendChild(button);
					tdef7.appendChild(button1);
					trow.appendChild(tdef1);
					trow.appendChild(tdef2);
					trow.appendChild(tdef3);
					trow.appendChild(tdef4);
					trow.appendChild(tdef5);
					trow.appendChild(tdef6);
					trow.appendChild(tdef7);
					trow.appendChild(tdef8);
					tbody.appendChild(trow);
			}
			xhr.send();
		}

			
			
	</script>
</body>
</html>