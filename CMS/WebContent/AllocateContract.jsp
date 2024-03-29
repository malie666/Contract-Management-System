<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>合同管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="shortcut icon" href="img/title.ico">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap_3.0.3/css/bootstrap.css">
    <link rel="stylesheet" href="css/main_css/supersized.css">
    <link rel="stylesheet" type="text/css" href="css/main_css/main.css">
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <%
	    ArrayList<Contract> contracts=(ArrayList<Contract>)request.getAttribute("contracts");
    	ArrayList<String> drafter=(ArrayList<String>)request.getAttribute("drafter");
	    Integer pageNo=(Integer)request.getAttribute("pageNo");
	    Integer pageNum=(Integer)request.getAttribute("pageNum");
	    Integer pageRecordNum=(Integer)request.getAttribute("pageRecordNum");
    %>
	
</head>
<body>
  <%@ include file="Head.jsp"%>
  <script type="text/javascript">
	document.getElementById("xtgl").setAttribute("class","active");
  </script>
   
  <div class="container-manage">
      <!-- 引用系统管理导航栏    -->
      <%@ include file="SystemManageNav.jsp" %>
      <script type="text/javascript">
		document.getElementById("fpht").setAttribute("class","list-group-item bg active");
      </script>
      
      <div class="panel panel-default col-sm-10 bg"><!--panel start-->
          <div class="panel-heading">
            <h3 class="panel-title">待分配合同列表</h3>
          </div>        
          <div class="panel-body"><!--panel body start-->
            <form class="form-horizontal" role="form" action="AllocateContract" method="get">            
              <div class="form-group">
                <label for="合同名称" class="col-sm-2 control-label">合同名称：</label>
                  <div class="input-group col-sm-4">
                    <input name="contractName" type="text" class="form-control">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default">搜索</button>
                    </span>
                  </div><!-- /input-group -->
              </div>
            </form>
            <table class="table table table-hover table-condensed table-condensed table-white">
                <thead>
                	<th>序号</th>
                    <th>合同名称</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>起草人</th>
                    <th>操作</th>
                </thead>
                <tbody>
                  <% if(contracts!=null){ %>
                  <% for(int i=0;i<contracts.size();i++){%>
                    <tr>
                        <td><%=((Contract)contracts.get(i)).GetId()%></td>
                        <td><%=((Contract)contracts.get(i)).GetName()%></td>
                        <td><%=((Contract)contracts.get(i)).GetStartTime()%></td>
                        <td><%=((Contract)contracts.get(i)).GetFinishTime()%></td>
                        <td><%=drafter.get(i)%></td>
                        <td><a href="AllocateContract?type=detail&id=<%=((Contract)contracts.get(i)).GetId()%>">分配</a></td>
                    </tr>
                   <%} %>
                   <%} %>
                </tbody>
            </table>
            <form class="form-horizontal" role="form" action="" method="post">
            <div class="form-group">
	          <div class="col-sm-4 col-sm-offset-4">
            
              <a class="col-sm-2 col-sm-offset-1" href="<%if(pageNo!=1){out.print("AllocateContract?pageNo=1");}else{out.print("#");}%>"><span class="glyphicon glyphicon-fast-backward myclickstyle"></span></a>
	      	  <a class="col-sm-2" href="<% if(pageNo>=2){out.print("AllocateContract?pageNo="+(pageNo-1));}else{out.print("#");} %>"><span class="glyphicon glyphicon-arrow-left myclickstyle"></span></a>
	      	  <span class="col-sm-2"><%=pageNo %>/<%=pageNum %></span>
	      	  <a class="col-sm-2" href="<% if(pageNo+1<=pageNum){out.print("AllocateContract?pageNo="+(pageNo+1));}else{out.print("#");} %>"><span class="glyphicon glyphicon-arrow-right myclickstyle"></span></a>
	      	  <a class="col-sm-2" href="<%if(pageNo!=pageNum){out.print("AllocateContract?pageNo="+pageNum);}else{out.print("#");}%>"><span class="glyphicon glyphicon-fast-forward myclickstyle"></span></a>
	      	  <!--<span>每页<input id="pageRecordNum" type="text" size="3" value="">条</span>-->
	          </div><!--display table page-->
	        </div>
	        </form>
          </div><!--panel body over-->
      </div><!--panel over-->
      
    </div>
   	<div style="margin-top:550px;"><jsp:include page="Footer.jsp"></jsp:include></div>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="css/bootstrap_3.0.3/js/jquery-2.0.2.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="css/bootstrap_3.0.3/js/bootstrap.js"></script>
  <script src="css/main_js/supersized.3.2.7.min.js"></script>
  <script src="css/main_js/supersized-init.js"></script>
</body>
</html>