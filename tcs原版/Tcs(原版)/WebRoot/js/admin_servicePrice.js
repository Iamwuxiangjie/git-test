function fan(ev){
	ev.children[0].style.height='0px';
	clearTimeout(ev.time);
	ev.time=setTimeout(function(){
		ev.children[0].style.height='150px';
	}, 3000); 
}