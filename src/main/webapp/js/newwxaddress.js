var ctx = $('#ctx').val();
var id = $('#addressid').val();
var map;
var mk;
var points = new Array();
var pp=null;
function G(id) {
    return document.getElementById(id);
}
//根据当前ip定位
var cityname="上海市"; 
/*
new BMap.LocalCity().get(function(result){
	 var center = result.center;
	 // 城市坐标中心点
     var point = new BMap.Point(center.lng,center.lat);
     // 设置
     map.centerAndZoom(point, 10);
     cityname = result.name;
     $('#cityname').val(cityname);
     // 设置显示的城市
     map.setCurrentCity(cityname);
 	 map.setCenter(cityname);
 	 map.setZoom(10);
});*/

 
$(document).ready(function () { 
	 
	loadmap();
	  
  });
 
var ac;

function loadmap(){
	// 百度地图API功能
	map = new BMap.Map("l-map"); // 创建地图实例
	if($('#latitude')!=null && $('#latitude').val()!=""
		&& $('#longitude')!=null && $('#longitude').val()!=""){
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
		map.centerAndZoom(new BMap.Point(longitude, latitude), 15); // 初始化地图，设置中心点坐标和地图级别
		var imgurl=ctx+"/images/newcasejiu.png";
		pp = new BMap.Point(longitude,latitude);
		mk = new BMap.Marker(pp);
		map.addOverlay(mk);
		mk.enableDragging();    //可拖拽
		mk.addEventListener("dragend", function() {
        	$("#latitude").val(mk.getPosition().lat);
    	    $("#longitude").val(mk.getPosition().lng);
    	   
    	    desAddr(mk.getPosition());	 
    	});
	}else if($('#cityname')!=null && $('#cityname').val()!=""){
		cityname = $('#cityname').val();
		map.centerAndZoom(cityname, 15); // 初始化地图，设置中心点坐标和地图级别
		 
	}else{
		//默认显示当前登录用户所在城市
		map.centerAndZoom(cityname, 15); // 初始化地图，设置中心点坐标和地图级别
		 
	}
	map.addEventListener("dragend",function(){
		map.clearOverlays();    //清除地图上所有覆盖物
		var centerPoint=map.getCenter();
 		mk = new BMap.Marker(centerPoint);
 		map.addOverlay(mk);
		desAddr(centerPoint);
		mk.enableDragging();    //可拖拽
		mk.addEventListener("dragend", function() {
        	$("#latitude").val(mk.getPosition().lat);
    	    $("#longitude").val(mk.getPosition().lng);
    	   
    	    desAddr(mk.getPosition());	 
    	});
		//alert(centerPoint.lng + " " +centerPoint.lat);
	});
	map.enableScrollWheelZoom();     
   	map.addControl(new BMapLib.TrafficControl({ showPanel: true}));//是否显示路况提示面板
	map.addControl(new BMap.NavigationControl()); //添加默认缩放平移控件
	//map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
	map.addControl(new BMap.ScaleControl()); // 添加比例尺控件
	map.addControl(new BMap.OverviewMapControl()); //添加缩略地图控件
	
	ac = new BMap.Autocomplete(    //建立一个自动完成的对象
            {"input" : "suggestId",
            "location" : map 
            });
	 
		var initValue = "";
		if($('#detailed')!=null && $('#detailed').val()!=""){
			initValue = $('#detailed').val();
			ac.setInputValue(initValue); 
			dwMarker(initValue);
	 	}
		 
        ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	       
	        var str = "";
	            var _value = e.fromitem.value;
	            var value = "";
	            if (e.fromitem.index > -1) {
	                value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	            }    
	            str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
	            
	            value = "";
	            if (e.toitem.index > -1) {
	                _value = e.toitem.value;
	                value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	            }    
	            str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
	            
	            G("searchResultPanel").innerHTML = str;
	        });

        var myValue;
        ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
            myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
            setPlace();
        });
        
        function setPlace(){
            map.clearOverlays();    //清除地图上所有覆盖物
            function myFun(){
                pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                map.centerAndZoom(pp, 15);
                mk = new BMap.Marker(pp);
                map.addOverlay(mk);    //添加标注
                mk.enableDragging();    //可拖拽
                mk.addEventListener("dragend", function() {
                	$("#latitude").val(mk.getPosition().lat);
            	    $("#longitude").val(mk.getPosition().lng);
            	    desAddr(mk.getPosition());
            		 
            	});
                
                $("#latitude").val(pp.lat);
        	    $("#longitude").val(pp.lng);
        	    
        	    $("#detailed").val(myValue);
                //map.addOverlay(new BMap.Marker(pp));    //添加标注
            }
            var local = new BMap.LocalSearch(map, { //智能搜索
              onSearchComplete: myFun
            });
            local.search(myValue);
        } 
} 


function dwMarker(initValue){
	var myGeo = new BMap.Geocoder();
	var suggestIdvalue = $('#suggestId').val();
	if(suggestIdvalue==null || suggestIdvalue==''){
		suggestIdvalue = initValue;
	}
	 
	map.clearOverlays(pp); 
	if (suggestIdvalue != null && "" != suggestIdvalue) {
		myGeo.getPoint(suggestIdvalue, function(point) {
			if (point) {
				
				 
				pp = point;
				map.centerAndZoom(pp, 15);
                mk = new BMap.Marker(pp);
                map.addOverlay(mk);    //添加标注
                mk.enableDragging();    //可拖拽
                mk.addEventListener("dragend", function() {
                	$("#latitude").val(mk.getPosition().lat);
            	    $("#longitude").val(mk.getPosition().lng);
            	    desAddr(mk.getPosition());
            		 
            	});
                
                $("#latitude").val(pp.lat);
        	    $("#longitude").val(pp.lng);
        	    
        	    $("#detailed").val(myValue); 
				 
				 
			}else{
				$("#latitude").val('');
        	    $("#longitude").val('');
				alert('无法定位到准确作业地点位置，请重试');
				 
			}
		}, "");
	}else{
		$("#latitude").val('');
	    $("#longitude").val('');
		alert('无法定位到准确作业地点位置，请重试');
	}  
}
 
 

var desAddr =function(p){
	
    new BMap.Geocoder().getLocation(p, function(rs){
       var addComp = rs.addressComponents;
       $("#detailed").val(addComp.district + addComp.street+ addComp.streetNumber);
       $("#suggestId").val(addComp.district + addComp.street+ addComp.streetNumber);
         
    });
};

function checkvalidate(){
	$("#wxaddressform").submit();  
}

 