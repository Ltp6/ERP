/**
 * 实时获取时间
 */
function fixNum(num){
				var reult=num<10?"0"+num:num;
				return reult;
			}
			function showtime(){
				var d= new Date();
				var year = d.getFullYear();
				var month = d.getMonth()+1;
				var day=d.getDate();
				var hour=d.getHours();
				var minute = d.getMinutes();
				var second = d.getSeconds();
				var week=d.getDay();
				year=fixNum(year);
				month=fixNum(month);
				day = fixNum(day);
				minute = fixNum(minute);
				second = fixNum(second);
				switch(week){
					case 0:
						week="星期日"
						break;
					case 1:
						week="星期一"
						break;
					case 2:
						week="星期二"
						break;
					case 3:
						week="星期三"
						break;
					case 4:
						week="星期四"
						break;
					case 5:
						week="星期五"
						break;
					case 6:
						week="星期六"
						break;
					defualt:
						break;
				}
				var time = year+"-"+month+"-"+day+"\t"+hour+":"+minute+":"+second+"\t"+week;
				document.getElementById("date").innerHTML=time;
				window.setTimeout("showtime()",1000);
			}