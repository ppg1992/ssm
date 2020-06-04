$(function(){
   //全部移到右边
       $('#alladd').click(function() {
    $('#leftselect option').remove().appendTo('#rightselect');
    });
    //全部移动左边
   $('#allremove').click(function() {
    $('#rightselect option').remove().appendTo('#leftselect');
    });
       //移到右边
    $('#add').click(function() {
    	$('#leftselect option:selected').remove().appendTo('#rightselect');
    });
    
    //带输入移到右边
    $('#inputadd').click(function() {
    	 $.messager.prompt("输入提示", "请输入扩展msg", function (data) {  
		 if (data) {             
			 alert(data);      
			 $('#leftselect option:selected').remove().appendTo('#rightselect');
			  
		}      
     });	
    });
    //移到左边
    $('#remove').click(function() {
    $('#rightselect option:selected').remove().appendTo('#leftselect');
    });
       //双击选项
    $('#leftselect').dblclick(function(){
        $("option:selected",this).remove().appendTo('#rightselect');
    });
    //双击选项
       $('#rightselect').dblclick(function(){
        $("option:selected",this).remove().appendTo('#leftselect');
    });
    //左边向上按钮
    $('#left_up').click(function(){
       var index = $('#leftselect option').index($('#leftselect option:selected:first'));
    var $recent = $('#leftselect option:eq('+(index-1)+')');
    if(index>0){
       var $options = $('#leftselect option:selected').remove();
    setTimeout(function(){
      $recent.before($options );
    },10);
    }
    });
    //左边向下按钮
    $('#left_down').click(function(){
       var index = $('#leftselect option').index($('#leftselect option:selected:last'));
    var len = $('#leftselect option').length-1;
    var $recent = $('#leftselect option:eq('+(index+1)+')');
    if(index<len ){
   var $options = $('#leftselect option:selected').remove();
    setTimeout(function(){
     $recent.after( $options );
    },10);
     }
    });
    //右边向上按钮
    $('#right_up').click(function(){
       var index = $('#rightselect option').index($('#rightselect option:selected:first'));
    var $recent = $('#rightselect option:eq('+(index-1)+')');
    if(index>0){
       var $options = $('#rightselect option:selected').remove();
    setTimeout(function(){
      $recent.before($options );
    },10);
    }
    });
    //右边向下按钮
    $('#right_down').click(function(){
       var index = $('#rightselect option').index($('#rightselect option:selected:last'));
    var len = $('#rightselect option').length-1;
    var $recent = $('#rightselect option:eq('+(index+1)+')');
    if(index<len ){
   var $options = $('#rightselect option:selected').remove();
    setTimeout(function(){
     $recent.after( $options );
    },10);
     }
    });
});
//判断Select是否存在某元素
function jsSelectIsExitItem(objSelect, objItemValue) {        
    var isExit = false; 
    for (var i = 0; i < objSelect.options.length; i++) {  
        if (objSelect.options[i].value == objItemValue) {        
            isExit = true;        
            break;        
         }        
     }        
    return isExit;        
 }
//获取Select所有元素的值
function getSelectItems(objSelect) {        
    var selectitems = "";        
    for (var i = 0; i < objSelect.options.length; i++) {        
    	selectitems = selectitems+ objSelect.options[i].value;  
    	if(i<objSelect.options.length-1){
    		selectitems = selectitems+",";
    	}
     }        
    return selectitems;        
 }
//获取Select所有元素的值+项
function getSelectItemsValueText(objSelect){
	var selectitems = "";        
    for (var i = 0; i < objSelect.options.length; i++) {        
    	selectitems = selectitems + objSelect.options[i].value;
    	selectitems = selectitems +":"+objSelect.options[i].text;
    	if(i<objSelect.options.length-1){
    		selectitems = selectitems+",";
    	}
     }        
    return selectitems;  
}
//清空Select
function clearSelList(SelList){
	SelList.options.length = 0; 
}