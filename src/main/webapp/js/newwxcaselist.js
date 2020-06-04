var ctx = $('#ctx').val(); 
$(document).ready(function () {
		jQuery(function() {
			var ctx = $('#ctx').val();
			var appId = $('#appId').val();
			var userid = $('#userid').val();
			var customeIndex = $('#customeIndex').val();
			var sbeginTime = $('#sbeginTime').val();
			var sendTiem = $('#sendTiem').val();
			var param="appId="+appId+"&userid="+userid+"&customeIndex="+customeIndex+"&sbeginTime="+sbeginTime+"&sendTiem="+sendTiem;
			var url = ctx+"/wechat/wxsendcaselist?"+param;
	    	
	         $('#more').more({'address': url});
	    });
    
});

function queryCase(caseQueryNo){
	 var ctx = $('#ctx').val();
	 var appId = $('#appId').val();
	 var queryurl=ctx+"/wechat/wxcaseinfo?appId="+appId+"&caseQueryNo="+caseQueryNo;
	 location.href=queryurl;
}







 