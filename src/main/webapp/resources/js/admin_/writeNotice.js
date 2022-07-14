function drop_category(){
	let click = document.getElementById("dropContent");
	let button = document.getElementById("button");
	let button180 = document.getElementById("button180");
	if(click.style.display == "none"){
		click.style.display = "block";
		
		button.innerHTML = "<i class='fal fa-chevron-circle-up fa-3x'></i>";
		
	}else{
		click.style.display = "none";
		button.innerHTML = "<i class='fal fa-chevron-circle-down fa-3x'></i>";

	}
}
