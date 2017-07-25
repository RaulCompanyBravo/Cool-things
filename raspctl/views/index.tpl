% rebase base


<body id="content" style="background-color:hsl(0, 0%, 18.82%);"></body>


<script type="text/javascript">

$(document).ready(function() {

	var load = function() {
		$.get('/system_info', function(data) {
			$('#content').html(data);
		});
	}
	load();
	// Every 2 seconds refresh de information of the dashboard
	setInterval(load, 30000);
});

</script>
