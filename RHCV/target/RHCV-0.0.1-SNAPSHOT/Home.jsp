<%@ page language="java" import="java.util.*,rhcv.Product" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
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

<body>
<% ArrayList<Product> ap = (ArrayList<Product>)request.getAttribute("adata");
System.out.println(ap.toString());%>
	<center>
		<h1>Shopping</h1>
		<label>Products:<select id="product" name="product">
				<option>select</option>
		</select></label> 
		<button onclick="minus()">-</button>
		<input type="text" id="quantity">
		<button onclick="plus()">+</button><br></br>
		<label>Price:<input type="text" id="price"></label>
		<form>
			 <input type="button" onclick="details()" value="submit">
		</form>
		<h2>Order Details</h2>
		<table>
			<thead>
				<th>Product_id</th>
				<th>Product_name</th>
				<th>Product_qty</th>
				<th>Product_price</th>
				<th>Remove</th>
			</thead>
			<tbody id="container">
			</tbody>
		</table>
		<form>
		<input type="button" value="Go To Payement Page"></form>
	</center>
	<script>
		function details() {
			var tbody = document.getElementById('container');
			var trow = document.createElement('tr');
			var tdef1 = document.createElement('td');
			var tdef2 = document.createElement('td');
			var tdef3 = document.createElement('td');
			var tdef4 = document.createElement('td');
			var tdef5 = document.createElement('td');
			var name = document.getElementById('name').value;
			var age = document.getElementById('age').value;
			var gender = document.getElementById('gender').value;
			var date = document.getElementById('date').value;
			tdef1.textContent = name;
			tdef2.textContent = age;
			tdef3.textContent = gender;
			tdef4.textContent = date;
			var button = document.createElement("button");
			button.textContent = "Remove";
			button.addEventListener('click', function() {
				const row = this.parentNode.parentNode;
				row.innerHTML = "";
			})
			tdef5.appendChild(button);
			trow.appendChild(tdef1);
			trow.appendChild(tdef2);
			trow.appendChild(tdef3);
			trow.appendChild(tdef4);
			trow.appendChild(tdef5);
			tbody.appendChild(trow);
			data += "&name=" + name + "&age=" + age + "&gender=" + gender
					+ "&date=" + date;
		}
	</script>
</body>
</html>