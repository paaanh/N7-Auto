<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>N7- Auto - Sự lựa chọn tin cậy</title>
    
    <!-- Font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
          integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">
    <link href="${url}/css/font-awesome.css" rel="stylesheet">
    
    <!-- Bootstrap -->
    <link href="${url}/css/bootstrap.css" rel="stylesheet">   
     <link rel="icon" href="${url}/images/favicon.png" type="image/x-icon">
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="${url}/css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="${url}/css/jquery.simpleLens.css">    
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="${url}/css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="${url}/css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="${url}/css/theme-color/default-theme.css" rel="stylesheet">
    
    <!-- Top Slider CSS -->
    <link href="${url}/css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="${url}/css/style.css" rel="stylesheet">    

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    

  </head>
    <body>
		    <style>
		  #aa-product-category {
		    background-color: #fafafa;
		    padding: 40px 0;
		  }
		  #aa-product-category .container {
		    max-width: 900px;
		    background: #fff;
		    border-radius: 12px;
		    box-shadow: 0 4px 20px rgba(0,0,0,0.05);
		    padding: 40px 60px;
		    line-height: 1.7;
		    color: #333;
		    font-size: 16px;
		  }
		  #aa-product-category h1 {
		    text-transform: uppercase;
		  }
		  #aa-product-category ul {
		    margin: 10px 0 20px 25px;
		  }
		  #aa-product-category strong {
		    color: #222;
		  }
		  #aa-product-category a {
		    color: #007bff;
		    text-decoration: none;
		  }
		</style>
		    
        
          <header id="aa-header">
            <jsp:include page = "topHeader.jsp" flush = "true" />
          
          <!-- / header bottom  -->
        </header>
          
        <!-- menu -->
        <jsp:include page = "menu.jsp" flush = "true" />
        <!-- / menu -->
        
          
        <!-- wpf loader Two -->
          <div id="wpf-loader-two">          
            <div class="wpf-loader-two-inner">
              <span>Loading...</span>
            </div>
          </div> 
          <!-- / wpf loader Two -->       
        <!-- SCROLL TOP BUTTON -->
          <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
        <!-- END SCROLL TOP BUTTON -->
