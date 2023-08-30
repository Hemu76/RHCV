<%@ page language="java" import="java.util.*,rhcv.Product"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

	<center>
		<h1>Shopping</h1>
		<label>Products:<select id="product" name="product">
				<option>select</option>
		</select></label>
		<button onclick="minus()">-</button>
		<input type="text" id="quantity" size="1">
		<button onclick="plus()">+</button><br></br>
		<button onclick="calculate()">Calculate</button>
		<br></br> <label>Price:<input type="text" id="price"></label>
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
		<label>Total Amount :<input type="text" id="total" ></label>
		<form>
			<a href="#"><input type="button" onclick="goto()" value="Go To Payement Page" ></a>
		</form>
		
	</center>
	
		<%
		ArrayList<Product> ap = (ArrayList<Product>) request.getAttribute("adata");
		for(Product p:ap){
	%>
	<script type="text/javascript">
			var from = document.getElementById("product");
				var option = document.createElement("option");
				option.textContent = "<%=p.getProductName()%>";
				from.appendChild(option);
		</script>
		<%} %>
	<script>
		var count=document.getElementById("quantity").value=0;
		var i=0;
		function plus(){
			i=i+1;
			document.getElementById("quantity").value=i;
		}
		function minus(){
			i=i-1;
			if(i<=0){
				i=0;
			}
			document.getElementById("quantity").value=i;
		}
		var j=0;
		var data="";
		function calculate(){
			
			var t1=document.getElementById("product").value;
			var t2=document.getElementById("quantity").value;
			var price = document.getElementById("price");
			console.log(t1);
			data="&pname="+t1+"&pcount="+t2;
			var ss = new XMLHttpRequest();
			ss.open('GET', 'gett?par=12'+ data, true)
			ss.onreadystatechange = function () {
				if (ss.readyState === 4) {
					price.value=ss.responseText;
					console.log('hello');
					console.log(ss.responseText);
					
				}
			}
			ss.send();
		}
		var tot=0;
		function details() {
			j=j+1;
			var tbody = document.getElementById('container');
			var trow = document.createElement('tr');
			var tdef1 = document.createElement('td');
			var tdef2 = document.createElement('td');
			var tdef3 = document.createElement('td');
			var tdef4 = document.createElement('td');
			var tdef5 = document.createElement('td');
			var product = document.getElementById('product').value;
			var quantity = document.getElementById('quantity').value;
			var price = document.getElementById('price').value;
			tdef1.textContent = j;
			tdef2.textContent = product;
			tdef3.textContent = quantity;
			tdef4.textContent = price;
			var button = document.createElement("button");
			button.textContent = "Remove";
			button.addEventListener('click', function() {
				const row = this.parentNode.parentNode;
				row.innerHTML = "";
				tot=tot-parseFloat(price);
				to.value=(tot);
				j=j-1;
			})
			tdef5.appendChild(button);
			trow.appendChild(tdef1);
			trow.appendChild(tdef2);
			trow.appendChild(tdef3);
			trow.appendChild(tdef4);
			trow.appendChild(tdef5);
			tbody.appendChild(trow);
			var to=document.getElementById("total");
			to.value=(tot+=parseFloat(price));	
		}
		function goto(){
			var totamt=parseInt(document.getElementById("total").value);
			window.location.href = "razor.jsp?tot="+totamt;
		}
		
	</script>
</body>
</html>