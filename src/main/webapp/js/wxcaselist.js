var ctx = $('#ctx').val(); 
$(document).ready(function () {
	$('#cofor').on('tap',function(){
		$('#severs').show(200);
	});
	$("#severs .function").on('tap',function(){
		var index = $(this).index();
		$('#severs .function').removeClass('active').eq(index).addClass('active');
		var adress = $('#cofor').html($('#severs .function').eq(index).html());
		var servicetype = $('#cofor .serviceType').val() != undefined?$('#cofor .serviceType').val():"";
		$("#servicetype").val(servicetype);
		$('#severs').hide(300);
	});
	jQuery(function() {
		var ctx = $('#ctx').val();
		var userid = $('#userid').val();
		var state  = $('#state').val();
		var pid = $('#pid').val();
		var sbeginTime = $('#sbeginTime').val();
		var sendTiem = $('#sendTiem').val();
		var address = $('#address').val();
		var caseno = $('#caseno').val();
		var servicetype = $('#servicetype').val();
		var param="userid="+userid+"&pid="+pid+"&sbeginTime="+sbeginTime+"&sendTiem="+sendTiem+"&address="+address+"&caseno="+caseno+"&servicetype="+servicetype;
		var url = ctx+"/platwechat/wxsendcaselist?"+param;
        $('#more').more({'address': url});

        //	选择当前服务类型
        var content = "#severs #"+servicetype;
        $(content).addClass('active');
        var adress = $('#cofor').html($(content).html());
    });
    
});

function queryCase(queryno){
	var caseno = queryno;
	var ctx = $('#ctx').val();
	var facid = $('#facid').val();
	var state = $('#state').val();
	var param = "?appId="+state+"&caseQueryNo="+queryno;
	var url = ctx +"/platwechat/wxcaseinfo"+param;
	location.href=url;
}






 