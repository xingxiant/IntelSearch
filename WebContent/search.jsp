<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#keyword{width:200px}
    #searchDiv{width:300px;position:absolute;top:50%;left:50%;margin-left:-200px;margin-top:-50px;height:50px;}
	#popDiv{width:200px;position:absolute;top:50%;height:200px;}
	#popDiv .show{background-color:#ccc;color:#aaa;width:200px;height:20px;}
	#popDiv .show:HOVER{background-color:#eee;}

</style>
<title>Insert title here</title>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js">
</script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#keyword").keyup(function(){
			
			//请求的URL
			var url="http://localhost:8081/IntelSearch/SearchServlet";
			text=$("#keyword").val();
			
			$.get(url,{content:text},function(data){
				var json = JSON.parse(data);
				//获取数据之后进行动态显示到输入框的下面。
				
                setContent(json); 
             
			}); 
		});
		
		
		
		
	});
	//设置关联数据的展示
    function setContent(contents){
        var size = contents.length;
        alert(contents);
        $("#popDiv").html("");
        for(var i = 0;i<size;i++){
            var nextNode = contents[i];//代表的是json格式数据的第i个元素
            var div=document.createElement("div");
            div.setAttribute("class","show");
            div.onclick=function(){
                //实现鼠标点击一个关联的数据时关联数据自动设置为输入框
            };
            var text = document.createTextNode(nextNode);
            div.appendChild(text);
            document.getElementById("popDiv").appendChild(div);
        }
    }
     
    function keyBlur(){
        document.getElementById("popDiv").innerHTML="";
    }
</script>
</head>
<body>
	<div id="searchDiv" >
		<input type="text" id="keyword"  >
		<input type="button" id="keybutton" value="百度一下">
		<div id="popDiv">
         
        </div>
	</div>
	
</body>
</html>