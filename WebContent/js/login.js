function active1(){
	var sign_in = document.getElementById("sign-in");
	var sign_up = document.getElementById("sign-up");
	sign_in.style.display = "block";
	sign_up.style.display = "none";
}

function active2(){
	var sign_in = document.getElementById("sign-in");
	var sign_up = document.getElementById("sign-up");
	sign_in.style.display = "none";
	sign_up.style.display = "block";
}

function download1(){
	var text = $("#download>button>span.text");
	var pic = $("#download>span.pic");
	if (text.text() === "下载知乎 App"){
		pic.css("display", "block");
		text.text("关闭二维码");
	} else{
		pic.css("display", "none");
		text.text("下载知乎 App");
	}
}