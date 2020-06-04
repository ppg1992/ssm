var ctx ;
var refreshTime = 10;
$(function () {
	ctx = $('#ctx').val();
    dlg_Edit = $('#Dlg-Edit').dialog({
        closed: true,
        modal: true,
        toolbar: [{
            text: '保存',
            iconCls: 'icon-save',
            handler: saveData
        }, '-', {
            text: '关闭',
            iconCls: 'icon-no',
            handler: function () {
                dlg_Edit.dialog('close');
            }
        }]
    });
    dlg_Edit_form = dlg_Edit.find('form');
    
    $('#btn-search,#btn-search-cancel').linkbutton();
    searchWin = $('#search-window').window({
        closed: true,
        modal: true
    });
    sel_info=$('#sel_info').window({closed: true});
    sel_info_form=sel_info.find("form");
    searchForm = searchWin.find('form');
    var url =  ctx+'/channel/getCaseDataList';
    grid = $('#grid');
    
    /*grid.datagrid('addFilterRule', {
    	field: 'phone',
    	op: 'equal',
    	value: '13900000000'
    });*/
   /* grid.datagrid('addFilterRule', {
    	field: 'phone',
    	op: 'equal',
    	value: '13900000000'
    });*/
    
    grid.datagrid({
		 
		view: detailview,
		detailFormatter: function(rowIndex, rowData){
			var returnstr="";
			returnstr = returnstr+'<table>';
			returnstr = returnstr+'<tr>';
			returnstr = returnstr+'<td style="border:0">';
			returnstr = returnstr+'<p>作业地址:【' + rowData.rescueCity+'】' +rowData.rescueAddress+'>>>>>目的地址:【'+rowData.desCity+'】'  + rowData.desAddress+ '</p>';
			returnstr = returnstr+'</td>';
			returnstr = returnstr+'</tr>';
			var haveCaseBackData = rowData.haveCaseBackData;
			if(haveCaseBackData){
				    returnstr = returnstr+'<tr>';
					returnstr = returnstr+'<td style="border:0">';
					returnstr = returnstr+'<p>接受时间:【' + rowData.inceptCaseTime+'】';
					returnstr = returnstr+'派遣时间:【'+rowData.sendCaseTime+'】';
					returnstr = returnstr+'抵达时间:【'+rowData.arriveCaseTime+'】';
					returnstr = returnstr+'完成时间:【'+rowData.completeCaseTime+'】';
					returnstr = returnstr+'取消时间:【'+rowData.abandonCaseTime+'】';
					returnstr = returnstr+'取消原因:【'+rowData.abandonCaseReason+'】';
					returnstr = returnstr+'</p>';
					returnstr = returnstr+'</td>';
					returnstr = returnstr+'</tr>';
					
					returnstr = returnstr+'<tr>';
					returnstr = returnstr+'<td style="border:0">';
					
					returnstr = returnstr+'<p>';
					if(rowData.checkRescueCity!=""){
						returnstr = returnstr+'核实作业地址:【' + rowData.checkRescueCity+'】' +rowData.checkRescueAddress;
					}
					if(rowData.checkDesCity!=""){
						returnstr = returnstr+'>>>>>核实目的地址:【'+rowData.checkDesCity+'】'  + rowData.checkDesAddress;
					}
					if(rowData.checkServiceItem!=""){
						returnstr = returnstr+' 核实服务类型:【'+rowData.checkServiceItem+'】';
					}
					
					returnstr = returnstr+'</p>';
					returnstr = returnstr+'</td>';
					returnstr = returnstr+'</tr>';
					
					
			}
			
			returnstr = returnstr+'</table>';
			return returnstr;
		}
	});
    
    grid.datagrid('enableFilter', [{
        field:'helpTime',
        type:'datetimebox',
        options:{precision:1},
        op:['equal','notequal','less','greater']
    },{
        field:'dataTime',
        type:'datetimebox',
        options:{precision:1},
        op:['equal','notequal','less','greater']
    },{
        field:'status',
        type:'combobox',
        options:{
            panelHeight:'auto',
            data:[{value:'',text:'全部'},{value:'已接收',text:'已接收'},{value:'已同步',text:'已同步'}],
            onChange:function(value){
            	 
                if (value == ''){
                	grid.datagrid('removeFilterRule', 'status');
                } else {
                	grid.datagrid('addFilterRule', {
                        field: 'status',
                        op: 'equal',
                        value: value
                    });
                }
                grid.datagrid('doFilter');
            }
        }
    }]);
    
    $('body').layout();
});
function doSearch(){
	var searchkey = $('#searchkey').val();
	grid.datagrid({ url: ctx+'/channel/getCaseDataList?', queryParams: {"searchkey":searchkey}});
}
function pushData(){
	var arr = getSelectedArr();
    var num = arr.length;
    
    if (num == 0) {
        Msgslide('请选择一条记录进行操作!'); //$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
        return;
    
    }else if (num>= 1 && num <=5) {
        $.messager.confirm('提示信息', '您确认要手动同步数据吗?', function (data) {
            if (data) {
                $.ajax({
                    url: ctx+'/channel/pushCaseData?strid='+arr2str(arr),
                    type: 'GET',
                    timeout: 1000,
                    error: function () {
                        $.messager.alert('错误', '同步失败!', 'error');
                    },
                    success: function (data) {
                        //eval('data=' + data);
                    	if (data.success) {	 
                    		
                    		$.messager.alert('提示信息', data.okcount+'条数据同步成功!', 'info');
                            grid.datagrid('reload');
                            grid.datagrid('clearSelections');
                        } else {
                            $.messager.alert('错误', data.msg, 'error');
                        }
                    }
                });
            }
        });
    } else {
        Msgshow('一次最多同时同步5条记录。');
    }
}

function reload(){  
	 grid.datagrid('reload');
} 
function createColumnMenu() {
    var tmenu = $('<div id="tmenu" style="width:100px;"></div>').appendTo('body');
    var fields = grid.datagrid('getColumnFields');
    for (var i = 0; i < fields.length; i++) {
        $('<div iconCls="icon-ok"/>').html(fields[i]).appendTo(tmenu);
    }
    tmenu.menu({
        onClick: function (item) {
            if (item.iconCls == 'icon-ok') {
                grid.datagrid('hideColumn', item.text);
                tmenu.menu('setIcon', {
                    target: item.target,
                    iconCls: 'icon-empty'
                });
            } else {
                grid.datagrid('showColumn', item.text);
                tmenu.menu('setIcon', {
                    target: item.target,
                    iconCls: 'icon-ok'
                });
            }
        }
    });
}

var grid;
var dlg_Edit;
var dlg_Edit_form; 
var searchWin;
var searchForm;
var sel_info;
var sel_info_form;
function getSelectedArr() {
    var ids = [];
    var rows = grid.datagrid('getSelections');
    for (var i = 0; i < rows.length; i++) {
        ids.push(rows[i].id);
    }
    return ids;
}
function getSelectedID() {
    var ids = getSelectedArr();
    return ids.join(',');
}
function arr2str(arr) {
    return arr.join(',');
}
 
 
 
function edit() {
    var rows = grid.datagrid('getSelections');
    var num = rows.length;
    if (num == 0) {
        Msgslide('请选择一条记录进行操作!'); //$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
        return;
    }
    else if (num > 1) {
        Msgfade('您选择了多条记录,只能选择一条记录进行修改!'); //$.messager.alert('提示', '您选择了多条记录,只能选择一条记录进行修改!', 'info');
        return;
    }else {
    	dlg_Edit.dialog('open');
        dlg_Edit_form.form('load', ctx+'/channel/inputChannelSourceData?id=' + rows[0].id); 
        dlg_Edit_form.url = ctx+'/channel/saveChannelSourceData';
        sourceNameValidate(rows[0].id); 
        loadStateComboboxData(rows[0].id);
    }
    
}  

function Msgshow(msg) {
    $.messager.show({
        title: '提示',
        msg: msg,
        showType: 'show'
    });
}
function Msgslide(msg) {
    $.messager.show({
        title: '提示',
        msg: msg,
        timeout: 3000,
        showType: 'slide'
    });
}
function Msgfade(msg) {
    $.messager.show({
        title: '提示',
        msg: msg,
        timeout: 3000,
        showType: 'fade'
    });
}
 
function showAll() {
	var searchkey = $('#searchkey').val();
	grid.datagrid({ url: ctx+'/channel/getCaseDataList?', queryParams: {"searchkey":searchkey}});
}
 
function OpensearchWin() {
    searchWin.window('open');
    searchForm.form('clear'); 
   
}

function OpensearchWinId(){
	  var rows = grid.datagrid('getSelections');
    var num = rows.length;
    if (num == 0) {
        Msgslide('请选择一条记录进行操作!'); //$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
        return;
    }
    else if (num > 1) {
        Msgfade('您选择了多条记录,只能选择一条记录进行修改!'); //$.messager.alert('提示', '您选择了多条记录,只能选择一条记录进行修改!', 'info');
        return;
    }else {
    	 
    	var userid =  rows[0].id;
        sel_info.window('open');
        sel_info_form.form('load', ctx+'/channel/inputCaseData?id=' + rows[0].id);
    }
} 
function saveData() {
    dlg_Edit_form.form('submit', {
        url: dlg_Edit_form.url,
        onSubmit: function () {
        	return $(this).form('validate');
        },
        success: function (data) { 
        eval('data=' + data);
        	//alert(data);
         if (data.success) {
                grid.datagrid('reload');
                dlg_Edit.dialog('close');
          } else {
                $.messager.alert('错误', data.msg, 'error');
          }
        }
    });
}
function searchOK() {
	 var query_name = $('#query_name').val();
	 var query_fid = $('#query_fid').combobox('getValue'); 
	 grid.datagrid({ url: ctx+'/channel/getChannelSourceData?', queryParams: {"sname":query_name,"sfid":query_fid}});
	 searchWin.window('close');
}
function closeSearchWindow() {
    searchWin.window('close');
}
 