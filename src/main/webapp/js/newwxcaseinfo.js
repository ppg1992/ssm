$(document).ready(function () {
	getWxConfig(); 
});
function wxcaraddress(){
	var ctx = $('#ctx').val();
	$("#wxcaraddressform").attr("action",ctx+"/wechat/sendcaraddress");
	$("#wxcaraddressform").submit();
}
function bigimg(imgurl){ 
	
	var imgurlstr = imgurl;
	 
	var urls =$('#urls').val();
	
	if(urls==null || urls==""){
		urls=imgurlstr;
	}
	//imgurlstr="http://img3.douban.com/view/photo/photo/public/p2152117150.jpg";
	//urls="http://img3.douban.com/view/photo/photo/public/p2152117150.jpg,http://img5.douban.com/view/photo/photo/public/p1353993776.jpg,http://img3.douban.com/view/photo/photo/public/p2152134700.jpg";
	//urls="'http://test.zonehand.com/freemarker/casephoto/2-150726470001/1437966536149.jpg','http://test.zonehand.com/freemarker/casephoto/2-150726470001/1437966518057.jpg','http://test.zonehand.com/freemarker/casephoto/2-150726470001/1437966499163.jpg'";
	// alert(imgurlstr);
	// alert(urls);
	 
	 var urlsarray = urls.split(',');
	wx.previewImage({
	      current: imgurlstr,
	      urls: urlsarray
	    });
}
function showjiben(){
	$("#jiben").show();
	$("#jibentab").attr("class", "sel");
	$("#dongtai").hide(); 
	$("#dongtaitab").removeClass();
	$("#zhaopian").hide();
	$("#zhaopiantab").removeClass();
}
function showdongtai(){
	$("#jiben").hide();
	$("#jibentab").removeClass();
	$("#dongtai").show();
	$("#dongtaitab").attr("class", "sel");
	$("#zhaopian").hide();
	$("#zhaopiantab").removeClass();
}
function showzhaopian(){
	$(".fangda").imgbox({
		'speedIn'		: 0,
		'speedOut'		: 0,
		'alignment'		: 'center',
		'overlayShow'	: true,
		'allowMultiple'	: false
	});
	$("#jiben").hide();
	$("#jibentab").removeClass();
	$("#dongtai").hide();
	$("#dongtaitab").removeClass();
	$("#zhaopian").show();
	$("#zhaopiantab").attr("class", "sel");
}
  


 
