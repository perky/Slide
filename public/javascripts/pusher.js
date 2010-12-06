
	var pusher = new Pusher('8a498c9f2919fe85d8e7');
	var myChannel = pusher.subscribe("<%=current_thread.id%>-posts");
	
	myChannel.bind('post-create', function(thing) {
	  alert('A thing was created: ' + thing.content);
		//$("#thread_posts").append( thing.content );
	});
