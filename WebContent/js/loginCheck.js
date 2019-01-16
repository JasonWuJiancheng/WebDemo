var modal = document.getElementById('modal');
var open = document.getElementById('showModal');
var close = document.getElementsByClassName('close')[0];
var sure = document.getElementById('sure');
var cancel = document.getElementById('cancel');
var form = document.getElementById('login');

var username_prompt = $("#username_prompt");
var password_prompt = $("#password_prompt");

function checkUsername() {
	var username_val = $("#username").val();
	if(username_val.trim() == "") {
		username_prompt.text("用户名不能为空");
		return false;
	} else {
		username_prompt.text("");
		return true;
	}
}

function checkPassword() {
	var password_val = $("#password").val();
	if(password_val.trim() == "") {
		password_prompt.text("密码不能为空");
		return false;
	} else {
		password_prompt.text("");
		return true;
	}
}

function reset() {
	username_prompt.text("");
	password_prompt.text("");
	$("#password").val("");
}

open.addEventListener('click', function() {
	modal.style.display = "block";
});
close.addEventListener('click', function() {
	modal.style.display = "none";
	reset();
});
sure.addEventListener('click', function() {
	var url = window.location.href;
	var f1 = checkUsername();
	var f2 = checkPassword();
	if(f1 && f2){
		$.ajax({
			type: "post",
			url: "/WebDemo/LoginServlet",
			data: $("#login").serialize(),
			success: function(data) {
				if(data === "no-such-user"){
					username_prompt.text("用户不存在");
					$("#password").val("");
					$("#username").focus();
				}else if(data === "wrong-password"){
					password_prompt.text("密码错误");
					$("#password").val("");
					$("#password").focus();
				}else if(data === "login-success") {
					doCookie();
					window.location.href = url;
				}else {
					alert("粗错啦！");
				}
			}
		});	
	}
});
cancel.addEventListener('click', function() {
	modal.style.display = "none";
	reset();
});

//cookie保存用户名
function doCookie(){
	if($("#remember_username").prop("checked")){	
		$.cookie("rmbUser", "true", { expires: 7 });
		$.cookie("username", $("#username").val(), { expires: 7 });
	}else {
		$.cookie("rmbUser", "false", { expire: -1 });
		$.cookie("username", "", { expires: -1 });
	}
}
$(function(){
	var username = $.cookie("username");
	if(username != null && username != '') {
		$("#username").val(username);
		$("#remember_username").attr('checked', true);
	}
});