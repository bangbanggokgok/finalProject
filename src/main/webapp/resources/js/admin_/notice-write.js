function drop_choiceFields(){
	let click = document.getElementById("choiceFieldsContainer");
	let icon = document.getElementById("inputField");
	if(click.style.display == "none"){
		click.style.display = "block";
		
		icon.innerHTML = "<i class='fal fa-angle-up'></i>";
	}else{
		click.style.display = "none";
		icon.innerHTML = "<i class='fal fa-angle-down'></i>";
	}
}


(function(){
	let click = document.getElementById("choiceFieldsContainer");
    const notice = document.getElementById("notice"); 
    const event = document.getElementById("event"); 
    const title = document.getElementById("title");
	notice.addEventListener("click", function(){
		
		title.innerText = "공지";
		click.style.display = "none";
		title.value = "notice";

		console.log(title.value);
	});

	event.addEventListener("click", function(){
		
		title.innerText = "이벤트";
		click.style.display = "none";
		event.value = "event";

		console.log(event.value);
	});
    
})();