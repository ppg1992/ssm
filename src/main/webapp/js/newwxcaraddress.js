var ctx = $('#ctx').val(); 
var map;
var mk; 
var pp=null;
function G(id) {
    return document.getElementById(id);
}
//根据当前ip定位
var cityname="上海市"; 

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
});

 
$(document).ready(function () { 
	 
	loadmap();
	  
  });
 
var ac;

function loadmap(){
	ctx = $('#ctx').val();
	
	// 百度地图API功能
	map = new BMap.Map("l-map"); // 创建地图实例
	if($('#latitude')!=null && $('#latitude').val()!=""
		&& $('#longitude')!=null && $('#longitude').val()!=""){
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
		map.centerAndZoom(new BMap.Point(longitude, latitude), 15); // 初始化地图，设置中心点坐标和地图级别
		var imgurl=ctx+"/static/images/car_busy.png";
		pp = new BMap.Point(longitude,latitude);
		mk = new BMap.Marker(pp,{icon:myIcon(imgurl)});
		map.addOverlay(mk); 
		map.setViewport([mk.getPosition()]);// 调整到最佳视野 
	}else{
		//默认显示当前登录用户所在城市
		map.centerAndZoom(cityname, 15); // 初始化地图，设置中心点坐标和地图级别
		 
	} 
	 
	map.enableScrollWheelZoom();     
   	map.addControl(new BMapLib.TrafficControl({ showPanel: true}));//是否显示路况提示面板
	map.addControl(new BMap.NavigationControl()); //添加默认缩放平移控件
	//map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
	map.addControl(new BMap.ScaleControl()); // 添加比例尺控件
	map.addControl(new BMap.OverviewMapControl()); //添加缩略地图控件
} 

/**
 * 设置自定义icon 偏移值，把icon的最下角作为定位点
 */
var myIcon =function(imgurl){
	var myIcon = new BMap.Icon(
			imgurl,
			new BMap.Size(30,33),
			{
				anchor: new BMap.Size(15,32),   // 图标的定位点相对于图标左上角的偏移值
		   		imageOffset: new BMap.Size(0,0)//图标所用的图片相对于可视区域的偏移值，此功能的作用等同于CSS中的background-position属性。
			}
		);  
	return myIcon;
	
}

 