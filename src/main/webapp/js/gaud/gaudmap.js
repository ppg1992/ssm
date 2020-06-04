 var  geolocation;
 var MGeocoder;
 var godtmap;
 var workdtmap;
 var dtmap; 
 var polylines= new Array();

 function loadmap(){ 
	//加载地图，调用浏览器定位服务
	 var mapObj, level = 10,
     center = {lng: 121.476753, lat: 31.224349},
     mapObj = new AMap.Map("mapContainer", {
    	 resizeEnable: true,keyboardEnable: false,
    	 center: new AMap.LngLat(center.lng, center.lat), 
    	 level: level
    	 });
  
  
	 mapObj.plugin(["AMap.ToolBar", "AMap.OverView", "AMap.Scale"], function(){
	 mapObj.addControl(new AMap.ToolBar);
	 mapObj.addControl(new AMap.OverView({isOpen: true}));
	 mapObj.addControl(new AMap.Scale);
	 }); 
	 mapObj.plugin('AMap.Geolocation', function() {
	    geolocation = new AMap.Geolocation({
	        enableHighAccuracy: true,//是否使用高精度定位，默认:true
	        timeout: 10000,          //超过10秒后停止定位，默认：无穷大
	        maximumAge: 0,           //定位结果缓存0毫秒，默认：0
	        convert: true,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
	        showButton: true,        //显示定位按钮，默认：true
	        buttonPosition: 'LB',    //定位按钮停靠位置，默认：'LB'，左下角
	        buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
	        showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
	        showCircle: true,        //定位成功后用圆圈表示定位精度范围，默认：true
	        panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
	        zoomToAccuracy: true      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
	    });
	    mapObj.addControl(geolocation);
	    AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
	    AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
	    
	}); 
	//实时路况图层
    var trafficLayer = new AMap.TileLayer.Traffic({
      zIndex: 10
    });
    trafficLayer.setMap(mapObj);
    trafficLayer.hide();
    isVisible = false;
    AMap.event.addDomListener(document.getElementById('control'),'click', function() {
        if (isVisible) {
          trafficLayer.hide();
          isVisible = false;
        } else {
          trafficLayer.show();
          isVisible = true;
        }
      }, false);
    //加载地理编码插件
    AMap.service(["AMap.Geocoder"], function() {
        MGeocoder = new AMap.Geocoder({
            radius: 1000,
            extensions: "all"
        });
    });
     
  //地图中添加地图操作ToolBar插件
    mapObj.plugin(["AMap.ToolBar"], function() {
        var toolBar = new AMap.ToolBar();
        mapObj.addControl(toolBar);
    });
  
  
    return mapObj;
 }
 
 function loadsimplemap(){ 
		//加载地图，调用浏览器定位服务
		 var mapObj, level = 10,
	     center = {lng: 121.476753, lat: 31.224349},
	     mapObj = new AMap.Map("mapContainer", {
	    	 resizeEnable: true,keyboardEnable: false,
	    	 center: new AMap.LngLat(center.lng, center.lat), 
	    	 level: level
	    	 });
		 mapObj.plugin('AMap.Geolocation', function() {
			    geolocation = new AMap.Geolocation({
			        enableHighAccuracy: true,//是否使用高精度定位，默认:true
			        timeout: 10000,          //超过10秒后停止定位，默认：无穷大
			        maximumAge: 0,           //定位结果缓存0毫秒，默认：0
			        convert: true,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
			        showButton: true,        //显示定位按钮，默认：true
			        buttonPosition: 'LB',    //定位按钮停靠位置，默认：'LB'，左下角
			        buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
			        showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
			        showCircle: true,        //定位成功后用圆圈表示定位精度范围，默认：true
			        panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
			        zoomToAccuracy: true      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
			    });
			    //mapObj.addControl(geolocation);
			    AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
			    AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
			    
			}); 
	   
		//实时路况图层
	    var trafficLayer = new AMap.TileLayer.Traffic({
	      zIndex: 10
	    });
	    trafficLayer.setMap(mapObj);
	    trafficLayer.hide();
	    isVisible = false;
	    AMap.event.addDomListener(document.getElementById('control'),'click', function() {
	        if (isVisible) {
	          trafficLayer.hide();
	          isVisible = false;
	        } else {
	          trafficLayer.show();
	          isVisible = true;
	        }
	      }, false);
	    //加载地理编码插件
	    AMap.service(["AMap.Geocoder"], function() {
	        MGeocoder = new AMap.Geocoder({
	            radius: 1000,
	            extensions: "all"
	        });
	    });
	     
	  
	    return mapObj;
	 }
//导航计算
 function drivingJsPath(mapObj,points){
 	var MDrive;
 	AMap.service(["AMap.Driving"], function() {
 	    var DrivingOption = {
 	    	//map: mapObj,
 	    	//panel: "result1",
 	        //驾车策略，包括 LEAST_TIME，LEAST_FEE, LEAST_DISTANCE,REAL_TRAFFIC
 	        policy: AMap.DrivingPolicy.LEAST_TIME
 	    };       
 	    MDrive = new AMap.Driving(DrivingOption); //构造驾车导航类
 	   
 	    //根据起终点坐标规划驾车路线
 	    if(points.length>1){
 	    	MDrive.search(points[0], points[1], function(status, result){
 		        if(status === 'complete' && result.info === 'OK'){
 		             //driving_routeCallBack(result);
 		        	 var returninfo =JSON.stringify(result); 
 		        	 var routeS = result.routes;
 		        	 var steps;
 		        	 var distance=0;
 		        	 var time=0;
 		        	 for(var v =0; v< routeS.length;v++){
 		        		 steps = routeS[v].steps;
 		        		 distance = routeS[v].distance;
 		        		 time =  routeS[v].time; 
 		        	 }
 		        	 dtmap={ distance:distance, time:time };
 		        	// alert("dtmap:"+JSON.stringify(dtmap));
 		        }else{
 		            //alert(result);
 		        }
 		    });
 	    }
 	});
  
 } 
 
//驾车导航
function drivingPath(mapObj,points){
	
	var MDrive;
	AMap.service(["AMap.Driving"], function() {
	    var DrivingOption = {
	    	//map: mapObj,
	    	//panel: "result1",
	        //驾车策略，包括 LEAST_TIME，LEAST_FEE, LEAST_DISTANCE,REAL_TRAFFIC
	        policy: AMap.DrivingPolicy.LEAST_TIME
	    };       
	    MDrive = new AMap.Driving(DrivingOption); //构造驾车导航类
	     
	    if(polylines!=null && polylines.length>0){
	    	for(var j=0;j<polylines.length;j++){
	    		polylines[j].setMap(null);
	    	}
	    }
	    //根据起终点坐标规划驾车路线
	    if(points.length>1){
	    	MDrive.search(points[0], points[1], function(status, result){
		        if(status === 'complete' && result.info === 'OK'){
		             //driving_routeCallBack(result);
		        	 var returninfo =JSON.stringify(result); 
		        	  
		        	 // mapObj.clearMap();
		        	 var routeS = result.routes;
		        	 
		        	 var steps;
		        	 var distance=0;
		        	 var time=0;
		        	 for(var v =0; v< routeS.length;v++){
		        		 steps = routeS[v].steps;
		        		 distance = routeS[v].distance;
		        		 time =  routeS[v].time; 
		        	 }
		        	 
		        	 godtmap={ distance:distance, time:time };
		        	// alert("go:"+JSON.stringify(godtmap));
	        		 drivingDrawLine(points[0],points[1],steps);

		        }else{
		            //alert(result);
		        }
		    });
	    }
	    if(points.length>2){
	    	MDrive.search(points[1], points[2], function(status, result){
		        if(status === 'complete' && result.info === 'OK'){
		        	 
		             //driving_routeCallBack(result);
		        	 var returninfo =JSON.stringify(result); 
		        	  
		        	 // mapObj.clearMap();
		        	 var routeS = result.routes;
		        	// alert(JSON.stringify(routeS));
			    	 
		        	 var steps;
		        	 var distance=0;
		        	 var time=0;
		        	 for(var v =0; v< routeS.length;v++){
		        		 steps = routeS[v].steps;
		        		 distance = routeS[v].distance;
		        		 time =  routeS[v].time; 
		        	 }
		        	 workdtmap={ distance:distance, time:time };
		        	  
		        	// alert("work:"+JSON.stringify(workdtmap));
	        		 drivingDrawLine(points[1],points[2],steps);

		        }else{
		            //alert(result);
		        }
		    });
	    }
	    
	    
	});
 
} 

function drivingInfoPath(mapObj,points,showmode,showlinesindex,linecolor){
	
	var MDrive;
	AMap.service(["AMap.Driving"], function() {
	    var DrivingOption = {
	    	//map: mapObj,
	    	//panel: "result1",
	        //驾车策略，包括 LEAST_TIME，LEAST_FEE, LEAST_DISTANCE,REAL_TRAFFIC
	        policy: AMap.DrivingPolicy.LEAST_TIME
	    };       
	    MDrive = new AMap.Driving(DrivingOption); //构造驾车导航类
	    if(showmode!="all"){
	    	if(polylines!=null && polylines.length>0){
		    	for(var j=0;j<polylines.length;j++){
		    		if(j!=showlinesindex){
		    			polylines[j].setMap(null);
		    		}
		    		
		    	}
		    }
	    }
	    //根据起终点坐标规划驾车路线
	    if(points.length>1){
	    	MDrive.search(points[0], points[1], function(status, result){
		        if(status === 'complete' && result.info === 'OK'){
		             //driving_routeCallBack(result);
		        	 var returninfo =JSON.stringify(result); 
		        	  
		        	 // mapObj.clearMap();
		        	 var routeS = result.routes;
		        	 
		        	 var steps;
		        	 var distance=0;
		        	 var time=0;
		        	 for(var v =0; v< routeS.length;v++){
		        		 steps = routeS[v].steps;
		        		 distance = routeS[v].distance;
		        		 time =  routeS[v].time; 
		        	 }
		        	 
		        	 godtmap={ distance:distance, time:time };
		        	// alert("go:"+JSON.stringify(godtmap));
		        	 drivingInfoDrawLine(points[0],points[1],steps,linecolor);

		        }else{
		            //alert(result);
		        }
		    });
	    }
	    if(points.length>2){
	    	MDrive.search(points[1], points[2], function(status, result){
		        if(status === 'complete' && result.info === 'OK'){
		        	 
		             //driving_routeCallBack(result);
		        	 var returninfo =JSON.stringify(result); 
		        	  
		        	 // mapObj.clearMap();
		        	 var routeS = result.routes;
		        	// alert(JSON.stringify(routeS));
			    	 
		        	 var steps;
		        	 var distance=0;
		        	 var time=0;
		        	 for(var v =0; v< routeS.length;v++){
		        		 steps = routeS[v].steps;
		        		 distance = routeS[v].distance;
		        		 time =  routeS[v].time; 
		        	 }
		        	 workdtmap={ distance:distance, time:time };
		        	  
		        	// alert("work:"+JSON.stringify(workdtmap));
		        	 drivingInfoDrawLine(points[1],points[2],steps,linecolor);

		        }else{
		            //alert(result);
		        }
		    });
	    }
	    
	    
	});
 
} 

 

/*//绘制驾车导航路线
function drivingDrawLine(start_xy,end_xy,steps) {
    //起点、终点图标
    var sicon = new AMap.Icon({
        image: "http://api.amap.com/Public/images/js/poi.png",
        size:new AMap.Size(44,44),
        imageOffset: new AMap.Pixel(-334, -180)
    });
    var startmarker = new AMap.Marker({
        icon : sicon, //复杂图标
        visible : true,
        position : start_xy,
        map:mapObj,
        offset : {
            x : -16,
            y : -40
        }
    });
    var eicon = new AMap.Icon({
        image: "http://api.amap.com/Public/images/js/poi.png",
        size:new AMap.Size(44,44),
        imageOffset: new AMap.Pixel(-334, -134)
    });
    var endmarker = new AMap.Marker({
        icon : eicon, //复杂图标
        visible : true,
        position : end_xy,
        map:mapObj,
        offset : {
            x : -16,
            y : -40
        }
    });
    //起点到路线的起点 路线的终点到终点 绘制无道路部分
    var extra_path1 = new Array();
    extra_path1.push(start_xy);
    extra_path1.push(steps[0].path[0]);
    var extra_line1 = new AMap.Polyline({
        map: mapObj,
        path: extra_path1,
        strokeColor: "#9400D3",
        strokeOpacity: 0.7,
        strokeWeight: 4,
        strokeStyle: "dashed",   //虚线
        strokeDasharray: [10, 5]
    });

    var extra_path2 = new Array();
    var path_xy = steps[(steps.length-1)].path;
    extra_path2.push(end_xy);
    extra_path2.push(path_xy[(path_xy.length-1)]);
    var extra_line2 = new AMap.Polyline({
        map: mapObj,
        path: extra_path2,
        strokeColor: "#9400D3",
        strokeOpacity: 0.7,
        strokeWeight: 4,
        strokeStyle: "dashed",  //虚线
        strokeDasharray: [10, 5]
    });

    var drawpath = new Array();
    for(var s=0; s<steps.length; s++){
        drawpath = steps[s].path;
        
        var polyline = new AMap.Polyline({
            map: mapObj,
            path: drawpath,
            strokeColor: "#9400D3",
            strokeOpacity: 0.7,
            strokeWeight: 4,
            strokeDasharray: [10, 5]
        });
    }
    mapObj.setFitView();
}*/
//绘制驾车导航路线
function drivingDrawLine(start_xy,end_xy,steps) {
    //起点、终点图标
    /*var sicon = new AMap.Icon({
        image: "http://api.amap.com/Public/images/js/poi.png",
        size:new AMap.Size(44,44),
        imageOffset: new AMap.Pixel(-334, -180)
    });
    var startmarker = new AMap.Marker({
        icon : sicon, //复杂图标
        visible : true,
        position : start_xy,
        map:mapObj,
        offset : {
            x : -16,
            y : -40
        }
    });
    var eicon = new AMap.Icon({
        image: "http://api.amap.com/Public/images/js/poi.png",
        size:new AMap.Size(44,44),
        imageOffset: new AMap.Pixel(-334, -134)
    });
    var endmarker = new AMap.Marker({
        icon : eicon, //复杂图标
        visible : true,
        position : end_xy,
        map:mapObj,
        offset : {
            x : -16,
            y : -40
        }
    });*/
    //起点到路线的起点 路线的终点到终点 绘制无道路部分
    var extra_path1 = new Array();
    extra_path1.push(start_xy);
    extra_path1.push(steps[0].path[0]);
    var extra_line1 = new AMap.Polyline({
        map: mapObj,
        path: extra_path1,
        strokeColor: "#9400D3",
        strokeOpacity: 0.7,
        strokeWeight: 4,
        strokeStyle: "dashed",   //虚线
        strokeDasharray: [10, 5]
    });
    
    polylines.push(extra_line1);
    var extra_path2 = new Array();
    var path_xy = steps[(steps.length-1)].path;
    extra_path2.push(end_xy);
    extra_path2.push(path_xy[(path_xy.length-1)]);
    var extra_line2 = new AMap.Polyline({
        map: mapObj,
        path: extra_path2,
        strokeColor: "#9400D3",
        strokeOpacity: 0.7,
        strokeWeight: 4,
        strokeStyle: "dashed",  //虚线
        strokeDasharray: [10, 5]
    });
    polylines.push(extra_line2);
    var drawpath = new Array();
   
    for(var s=0; s<steps.length; s++){
        drawpath = steps[s].path;
        var polyline = new AMap.Polyline({
            map: mapObj,
            path: drawpath,
            strokeColor: "#9400D3",
            strokeOpacity: 0.7,
            strokeWeight: 4,
            strokeDasharray: [10, 5]
        });
        
        polylines.push(polyline);
        mapObj.setFitView();
    }
   
    
   
}

//绘制驾车导航路线
function drivingInfoDrawLine(start_xy,end_xy,steps,linecolor) {
    
    //起点到路线的起点 路线的终点到终点 绘制无道路部分
    var extra_path1 = new Array();
    extra_path1.push(start_xy);
    extra_path1.push(steps[0].path[0]);
    var extra_line1 = new AMap.Polyline({
        map: mapObj,
        path: extra_path1,
        strokeColor: linecolor,//"#9400D3",
        strokeOpacity: 0.7,
        strokeWeight: 4,
        strokeStyle: "dashed",   //虚线
        strokeDasharray: [10, 5]
    });
    polylines.push(extra_line1);
    var extra_path2 = new Array();
    var path_xy = steps[(steps.length-1)].path;
    extra_path2.push(end_xy);
    extra_path2.push(path_xy[(path_xy.length-1)]);
    var extra_line2 = new AMap.Polyline({
        map: mapObj,
        path: extra_path2,
        strokeColor: linecolor,//"#9400D3",
        strokeOpacity: 0.7,
        strokeWeight: 4,
        strokeStyle: "dashed",  //虚线
        strokeDasharray: [10, 5]
    });
    polylines.push(extra_line2);
    var drawpath = new Array();
   
    for(var s=0; s<steps.length; s++){
        drawpath = steps[s].path;
        var polyline = new AMap.Polyline({
            map: mapObj,
            path: drawpath,
            strokeColor: linecolor,//"#9400D3",
            strokeOpacity: 0.7,
            strokeWeight: 4,
            strokeDasharray: [10, 5]
        });
        
        polylines.push(polyline);
        mapObj.setFitView();
    }
   
    
   
}

function addPolyline(lineArr,showmode,showlinesindex,linecolor) {
	if(showmode!="all"){
    	if(polylines!=null && polylines.length>0){
	    	for(var j=0;j<polylines.length;j++){
	    		if(j!=showlinesindex){
	    			polylines[j].setMap(null);
	    		}
	    		
	    	}
	    }
    }
    var polyline = new AMap.Polyline({
      path: lineArr,          //设置线覆盖物路径
      strokeColor: linecolor, //线颜色
      strokeOpacity: 1,       //线透明度
      strokeWeight: 5,        //线宽
      strokeStyle: "solid",   //线样式
      strokeDasharray: [10, 5] //补充线样式
    });
    polyline.setMap(mapObj);
    polylines.push(polyline);
    mapObj.setFitView();
  } 


//获取当前位置信息
function getCurrentPosition() {
    geolocation.getCurrentPosition();
}
 
//监控当前位置并获取当前位置信息
function watchPosition() {
    geolocation.watchPosition();
}
 
//解析定位结果
function onComplete(data) {
    var str = '<div>定位成功</div>';
    str += '<div>经度：' + data.position.getLng() + '</div>';
    str += '<div>纬度：' + data.position.getLat() + '</div>';
    str += '<div>精度：' + data.accuracy + ' 米</div>';
    str += '<div>是否经过偏移：' + (data.isConverted ? '是' : '否') + '</div>';
    result.innerHTML = str;
}







//解析定位错误信息
function onError(data) {
     var str = '<p>定位失败</p>';
     str += '<p>错误信息：'
     switch (data.info) {
         case 'PERMISSION_DENIED':
             str += '浏览器阻止了定位操作';
             break;
         case 'POSITION_UNAVAILBLE':
             str += '无法获得当前位置';
             break;
         case 'TIMEOUT':
             str += '定位超时';
             break;
         default:
             str += '未知错误';
             break;
     }
     str += '</p>';
     result.innerHTML = str;
 }