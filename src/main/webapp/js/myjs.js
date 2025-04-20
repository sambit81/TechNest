function doLike(pid, uid) {
	console.log(pid + "," + uid)
	const d = {
		uid: uid,
		pid: pid,
		operation: 'like'
	}
	
	$.ajax ({
		url: "LikeServlet",
		data: d,
		success: function (data, textStatus, jqXHR) {
			console.log(data+",,,,,,,,");
			if (data.indexOf("!") != -1) {
				let c = $(".like-counter"+pid).html();
				c--;
				$(".like-counter"+pid).html(" "+c);
				console.log("PID"+pid);
				$("#like-counter"+pid).removeClass();
				$("#like-counter"+pid).addClass("fa-regular fa-thumbs-up");
				
			}
			else {
				let c = $(".like-counter"+pid).html()
				c++;
				$('.like-counter'+pid).html(" " + c);
				$("#like-counter"+pid).removeClass();
				$("#like-counter"+pid).addClass("fa-solid fa-thumbs-up");
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(data+",,,,");
		}
	})
}