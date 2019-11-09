<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/4/29
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">
    var xmlHttpRequest;
    function createXMLHttpRequest()
    {
        if (window.XMLHttpRequest) //非IE浏览器
        {
            xmlHttpRequest = new XMLHttpRequest();
        }
        else if (window.ActiveObject)//IE6以上浏览器
        {
            xmlHttpRequest = new ActiveObject("Msxml2.XMLHTTP");
        }
        else //IE6及以下浏览器
        {
            xmlHttpRequest = new ActiveObject("Microsoft.XMLHTTP");
        }
    }

    function sendRequest(url){
        createXMLHttpRequest();
        xmlHttpRequest.open("GET", url, true);
        xmlHttpRequest.onreadystatechange = processResponse;
        xmlHttpRequest.send(null);
    }

    function processResponse(){
        if(xmlHttpRequest.readyState == 4){
            if(xmlHttpRequest.status == 200){
                var resultList = document.getElementById("resultList");
                resultList.innerHTML = "";	//remove all child nodes
                var productList = xmlHttpRequest.responseXML.getElementsByTagName("productList")[0];
                for(var i=0;i < productList.children.length;i++){
                    var product = productList.childNodes.item(i);
                    var productId = product.firstChild.textContent;
                    var name = product.lastChild.textContent;
                    var option = document.createElement("option");
                    option.innerHTML = name;
                    resultList.appendChild(option);
                }
            }
        }
    }
    function searchSelect(event){
        var keyword = document.getElementById("keyword").value;
        sendRequest("searchProductAJAX?keyword="+keyword);
    }

</script>

<head>
    <link rel="StyleSheet" href="css/jpetstore.css" type="text/css" media="screen" />

    <meta name="generator" content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org" />
    <title>Mypetstore</title>
    <meta content="text/html; charset=windows-1252" http-equiv="Content-Type" />
    <meta http-equiv="Cache-Control" content="max-age=0" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="Pragma" content="no-cache" />
</head>

<body>

<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <a href="main"><img src="images/logo-topbar.gif" /></a>
        </div>
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <a href="viewCart">
                <img align="middle" name="img_cart" src="images/cart.gif" />
            </a>
            <img align="middle" src="images/separator.gif" />
            <c:if test="${sessionScope.account == null}">
            <a href="login">Sign In</a>
            </c:if>
            <c:if test="${sessionScope.account != null}">
            <a href="signOut">
                Sign Out
            </a>
            <img align="middle" src="images/separator.gif" />
             <a href="editAccount">
                 My Account
             </a>
            </c:if>
            <img align="middle" src="images/separator.gif" /> <a href="viewHelp">?</a>
        </div>
    </div>

    <div id="Search">
        <div id="SearchContent">
            <form action="searchProduct" method="post">
                <input type="text" name="keyword" size="14" />
                <input type="submit" name="searchProducts" value="Search" />
            </form>
        </div>
    </div>

    <div id="QuickLinks">
        <a href="viewCategory?categoryId=FISH">
            <img src="images/sm_fish.gif" />
        </a>
        <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=DOGS">
            <img src="images/sm_dogs.gif" />
        </a>
        <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=REPTILES">
            <img src="images/sm_reptiles.gif" />
        </a>
        <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=CATS">
            <img src="images/sm_cats.gif" />
        </a>
        <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=BIRDS">
            <img src="images/sm_birds.gif" />
        </a>
    </div>

</div>

<div id="Content">
