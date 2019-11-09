<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
	<form action="login" method="post">

		<p>Please enter your username and password.</p>
		<p>Username:
			<input type="text" name="username">
			<br/>
		Password:
			<input type="password" name="password">
		</p>
		<tr>
			<td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Identyfying Code:</td>
			<td valign="bottom">
				<input type="text" name="vercode"/>
				<img alt="" src="authImg" id="authImg" align="absmiddle">
				<a href="login" onclick="refresh()">
							CHANGE
				</a>
			</td>
			<!--<td valign="bottom">
				<input type="text" name="vercode"/>
				<img alt="" src="/authImg" id="authImg" align="absmiddle">
			</td>-->
		</tr>
		<input type="submit" name="signon" value="Login">
	</form>
	Need a user name and password?
	<a href="register">
		Register Now!
	</a>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>

