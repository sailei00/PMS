/**************************************************************************
 * DESC ：公用函数变量定义
 * MODIFYLIST ：   Date                      Reason/Contents
 *          ------------------------------------------------------
 *                       2016-8-30       增加String.startWith和String.endWith函数
 *                       2016-9-6         增加alertObj函数，alert指定对象内部属性
 *                   
 **************************************************************************/

/**************************************************************************
	函数组        函数名称                										函数作用
	系统函数
	字符串处理函数
				String.prototype.startWith						测试此字符串从指定索引开始的子字符串是否以指定前缀开始。 
				String.prototype.endWith							测试此字符串是否以指定的后缀结束。
	日期处理函数
				compareFullDate(date1,date2)					比较两个日期字符串（不含时间）date1=date2则返回0 , date1>date2则返回1 , date1<date2则返回-1	
	对象处理函数
				alertObj													显示指定对象内部结构和属性
 **************************************************************************/

// 定义常数
var DATE_DELIMITER = "-"; // 日期分隔符

// 将form中的值转换为键值对。
function getFormJson(frm) {
	var o = {};
	var a = $(frm).serializeArray();
	$.each(a, function() {
		if (o[this.name] !== undefined) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});

	return o;
}

String.prototype.endWith = function(s) {
	if (s == null || s == "" || this.length == 0 || s.length > this.length)
		return false;
	if (this.substring(this.length - s.length) == s)
		return true;
	else
		return false;
	return true;
}

String.prototype.startWith = function(s) {
	if (s == null || s == "" || this.length == 0 || s.length > this.length)
		return false;
	if (this.substr(0, s.length) == s)
		return true;
	else
		return false;
	return true;
}

// 比较两个日期字符串
// date1=date2则返回0 , date1>date2则返回1 , date1<date2则返回-1
function compareFullDate(date1, date2) {
	// 获取字符串的分割符号

	strdate1_split = get_datesplit(date1);
	strdate2_split = get_datesplit(date2);
	var strValue1 = date1.split(strdate1_split);
	var date1Temp = new Date(strValue1[0], parseInt(strValue1[1], 10) - 1,
			parseInt(strValue1[2], 10));
	var strValue2 = date2.split(strdate2_split);
	var date2Temp = new Date(strValue2[0], parseInt(strValue2[1], 10) - 1,
			parseInt(strValue2[2], 10));

	if (date1Temp.getTime() == date2Temp.getTime())
		return 0;
	else if (date1Temp.getTime() > date2Temp.getTime())
		return 1;
	else
		return -1;
}

// 获取日期字符串的分割符
function get_datesplit(strdate) {
	if (strdate.match("/"))
		return "/"
	if (strdate.match("-"))
		return "-"
}




// 得到日期的字符串表达形式，传入参数为Date类型
// 如果不传，则默认为当天
function convertFullDateToString(date) {
	var chgMonth;// 改变格式的月

	var chgDay;// 改变格式的日期

	if (date == null) {
		date = new Date();
	}

	var strDate = "";

	if (date.getMonth() + 1 < 10) {
		chgMonth = date.getMonth() + 1;//
		chgMonth = "0" + chgMonth;
	} else {
		chgMonth = date.getMonth() + 1;//
	}
	if (date.getDate() < 10) {
		chgDay = date.getDate();//
		chgDay = "0" + chgDay;
	} else {
		chgDay = date.getDate();//
	}
	strDate = date.getFullYear() + DATE_DELIMITER + chgMonth + DATE_DELIMITER
			+ chgDay;
	return strDate;
}



/*打印对象属性 
只打印对象的直接属性，即第一层属性 
如果对象属性个数大于15个，则每三个属性为一行，否则一个属性为一行 
@JSON 支持JSON参数传递或者直接把对象作为参数传递 
 
JSON可用参数： 
@obj:打印的对象 
@key:对象属性的过滤条件，模糊匹配(不区分大小写) 默认为空 
@tab:每个属性前边的制表符号。默认为空 
@title:题目，默认为对象属性 
@showFun:是否显示方法体内容 默认为false 
*/  
var alertObj=function(JSON){  
    JSON = JSON||{};  
    if(!!JSON.obj===false){  
        JSON = {obj:JSON};  
    }  
    var aObj = JSON.obj||{};//打印对象  
    var key  = JSON.key ||"";//属性名称过滤条件  
    var tab  =JSON.tab ||"";//制表位  
    var title =JSON.title ||"对象属性";//题目  
    var showFun  = JSON.showFun || false;//是否显示方法体内容 默认为false  
      
    //TODO 属性排序  
    var propertys = [];  
    for(var o in aObj){  
        //没有属性过滤条件，或者属性包含过滤条件。  
        if(!!key===false || (!!key===true && (o+"").toLowerCase().indexOf(key)>=0) ){  
            propertys.push(o);  
        }  
    }  
    propertys.sort();  
    var len = propertys.length;  
    var index = 1;  
    var max =20;//每次最多打印max个属性(受alert可显示空间限制)  
    var v = title+":\n";   
    for(var i in propertys){  
        var o = propertys[i];  
        if(typeof(aObj[o])!=="object" && typeof(aObj[o])!=="function" ){  
            v+=(tab+"-"+o+"："+aObj[o]+"\n");              
        }else if(typeof(aObj[o])=="function"){  
            if(showFun!=true){  
                v+=(tab+"+"+o+"：[function]\n");  
            }else{  
                v+=(tab+"+"+o+"："+aObj[o]+"\n");  
            }  
        }else{  
            v+=(tab+"+"+o+"：[object]\n");  
        }  
        if(index++%max==0){  
            alert(v);  
            //第二次打印将会追加编号  
            v = title+Math.ceil(index/max)+":\n"; ;//置空，从新累加  
        }  
    }  
    if(len%max!=0 || len==0){//打印最后一次 | len=0表示没有匹配的属性  
        alert(v);  
    }  
      
    //alert("len = "+len+",max  ="+max+","+len%max);  
}  