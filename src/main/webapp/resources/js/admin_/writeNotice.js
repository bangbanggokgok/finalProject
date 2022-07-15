function drop_choiceFields(){
	let click = document.getElementById("choiceFieldsContainer");
	let button = document.getElementById("inputFieldsContainer");
	let icon = document.getElementById("inputField");
	if(click.style.display == "none"){
		click.style.display = "block";
		
		icon.innerHTML = "<i class='fal fa-angle-up'></i>";
		console.log(icon);
	}else{
		click.style.display = "none";
		icon.innerHTML = "<i class='fal fa-angle-down'></i>";
		console.log(icon);
	}
}