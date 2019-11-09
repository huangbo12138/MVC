<%@ include file="../common/IncludeTop.jsp"%>
<script type="text/javascript">
	var xmlHttpRequest;
	function createXMLHttpRequest()
	{
		if (window.XMLHttpRequest) //éIEæµè§å¨
		{
			xmlHttpRequest = new XMLHttpRequest();
		}
		else if (window.ActiveObject)//IE6ä»¥ä¸æµè§å¨
		{
			xmlHttpRequest = new ActiveObject("Msxml2.XMLHTTP");
		}
		else
		{
			xmlHttpRequest = new ActiveObject("Microsoft.XMLHTTP");
		}
	}

	function usernameIsExist() {
		alert(document.getElementById("username").value);
		var username = document.getElementById("username").value;
		if (username == "") {
			var div1 = document.getElementById("usernameInfo");
			div1.innerHTML="<font color='red'>The User ID Cannot Be NULL</font>";
		} else {
			sendRequest2("usernameIsExist?username=" + username);
		}
	}

	function sendRequest2(url){
		createXMLHttpRequest();
		xmlHttpRequest.open("GET", url, true);
		xmlHttpRequest.onreadystatechange = processResponse2;
		xmlHttpRequest.send(null);
	}

	function processResponse2(){
		if(xmlHttpRequest.readyState == 4){
			if(xmlHttpRequest.status == 200){
				var responseInfo = xmlHttpRequest.responseXML.getElementsByTagName("info")[0].firstChild.textContent;
				var div1 = document.getElementById("usernameInfo");
				if(responseInfo == "Exist"){
					div1.innerHTML="<font color='red'>The User ID is Exist</font>";
				}
				else{
					div1.innerHTML="<font color='green'>The User ID is Available</font>";
				}
			}
		}

	}



</script>
<div id="Catalog">
	<form action="newAccount" method="post">
		<h3>User Information</h3>

		<table>
			<tr>
				<td>User ID:</td>
				<td><input type="text" name="account.username" id="username" onblur="usernameIsExist();"/></td>
			 <div id="usernameInfo"></div>
			</tr>
			<tr>
				<td>New password:</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td>Repeat password:</td>
				<td><input type="password" name="repeatedPassword" /></td>
			</tr>
		</table>

		<%@ include file="IncludeAccountFields.jsp"%>
		<input type="submit" value="Save Account Information">

	</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>