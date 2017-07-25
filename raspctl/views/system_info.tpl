	% used = int(float(info['USED_MEMORY']) / float(info['MEMORY_TOTAL']) * 100)
	% free = int(float(info['FREE_MEMORY']) / float(info['MEMORY_TOTAL']) * 100)
	% if used < 70:
	%   color = "success"
	% else:
	%   if used < 85:
	%     color = "warning"
	%   else:
	%     color = "danger"
	%   end
	% end
<html style="background-color:hsl(0, 0%, 18.82%);">
    <head>
        <link rel="stylesheet" type="text/css" href="./bulma.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    </head>
<body>

<div class="container is-fluid" style="padding:0px 0px;margin:0px 0px;">
<nav class="navbar" style="background-color:rgb(40,40,40);">
  <div class="navbar-brand" >
    <a class="navbar-item is-hidden-desktop" href="https://github.com/jgthms/bulma" target="_blank">
      <span class="icon" style="color: white;">
        <i class="fa fa-github"></i>
      </span>
    </a>

    <a class="navbar-item is-hidden-desktop" href="https://twitter.com/elraulcb" target="">
      <span class="icon" style="color: white;">
        <i class="fa fa-twitter"></i>
      </span>
    </a>
    
    <a class="navbar-item is-hidden-desktop" onclick="location.reload();">
      <span class="icon" style="color: white;">
        <i class="fa fa-refresh" aria-hidden="true"></i>
      </span>
    </a>
<!--
    <div class="navbar-burger burger" data-target="navMenuExample">
      <span></span>
      <span></span>
      <span></span>
    </div>
	-->
  </div>
  
  

  <div id="navMenuExample" class="navbar-menu">
    <div class="navbar-start" style="padding-left:15px;">
    <a class="navbar-item" href="https://github.com/jgthms/bulma" target="_blank">
      <span class="icon" style="color: white;">
        <i class="fa fa-github"></i>
      </span>
    </a>
      <a class="navbar-item" href="https://twitter.com/elraulcb" target="_blank">
      <span class="icon" style="color: white;">
        <i class="fa fa-twitter"></i>
      </span>
    </a>

      </a>
      
    </div>

    <div class="navbar-end">
      
      <div class="navbar-item" style="padding-right:15px;">
        
        
      <a class="navbar-item" onclick="location.reload();">
      <span class="icon" style="color: white;">
        <i class="fa fa-refresh" aria-hidden="true"></i>
      </span>
    </a>
        </div>
      </div>
    </div>
  </div>
</nav>

<div class="columns" style="padding:21px 10px 0px 10px;">
      <div class="column" style="padding-top:0px;">
        <div class="box notification is-info">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <p style="text-align:center;color: #D8D8D8;">
                  <strong>Basic information</strong>
                  <br>
                  Hostname <small>{{info['HOSTNAME']}}</small><br />
                  IP address <small>{{info['IP_ADDRESS']}}</small><br />
                  Uptime <small>{{info['UPTIME']}}</small>
                </p>
              </div>
        
            </div>
          </article>
        </div>
      </div>
            <div class="column" style="padding-top:0px;">
        <div class="box notification is-success">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <p style="text-align:center;color: #D8D8D8;">
                    <strong>Processor</strong>
                  <br>
                    {{info['PROCESSOR_NAME'].strip() or info['PROCESSOR_NAME2']}} </br>
                    Temperature {{"%.2f ºC / %.2f ºF" % (temp['c'], temp['f']) if temp else "unknown"}} </br>
                    Current speed {{info['PROCESSOR_CURRENT_SPEED']}} Hz
              </div>
        
            </div>
          </article>
        </div>
      </div>
      <div class="column" style="padding-top:0px;">
         <div class="box notification" style="background-color:#8904B1;">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <p style="text-align:center;color: #D8D8D8;">
                    <strong>Memory usage</strong>
                    <br >
                    <progress class="progress is-small" value="{{used}}" max="100" style="margin:6px 0px 5px 0px;width:104%;"></progress>
                    Used {{h.sizeof_pretty(info['USED_MEMORY'])}}  <br />
                    Free {{h.sizeof_pretty(info['FREE_MEMORY'])}} 
              </div>
        
            </div>
          </article>
        </div>     
      
      </div>
      <div class="column" style="padding-top:0px;">
        <div class="box notification is-danger">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <p style="text-align:center;color: #D8D8D8;">
					% if not info['DISK_TOTAL']:
					<div>
						<p><span>Error! We have been unable to retreive the disk usage information!</span></p>
					</div>
					% else:
						% clean = lambda str: float(filter(lambda x: x.isdigit() or '.' == x, str.replace(',', '.')))
						% used2 = int(clean(info['DISK_USED']) / clean(info['DISK_TOTAL']) * 100)
						% free2 = int(clean(info['DISK_FREE']) / clean(info['DISK_TOTAL']) * 100)
						% if used2 < 70:
						%   color = "success"
						% else:
						%   if used2 < 85:
						%     color = "warning"
						%   else:
						%     color = "danger"
						%   end
						% end
                    <strong>Disk usage</strong>
                    <br >
                    <progress class="progress is-small" value="{{used2}}" max="100" style="margin:6px 0px 5px 0px;width:104%;"></progress>
                    Used {{h.sizeof_pretty(info['DISK_USED'])}} <br />
                    Free {{h.sizeof_pretty(info['DISK_FREE'])}}
              </div>
        
            </div>
          </article>
        </div>     
      </div>
    </div>
    
    <div class="columns" style="padding:0px 10px 0px 10px;">
      <div class="column" style="padding-top:0px;">
        <div class="box notification" style="background-color:#DBA901;">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <p style="text-align:center;color: #D8D8D8;">
                  <strong>Top processor processes</strong>
                  <br>
						% for process in info['TOP_PROCESSES'].split('#'):
							% if process:
								% usage, pid, name = process.split(' ', 2)
								{{name}} PID: {{pid}} - {{usage}}% <br />
							% end
						% end
                </p>
              </div>
            </div>
          </article>
        </div>
      </div>
      <div class="column" style="padding-top:0px;">
        <div class="box notification" style="background-color:#DF01A5;">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <p style="text-align:center;color: #D8D8D8;">
                    <strong>Top memory processes</strong>
                  <br>
				  		% for process in info['TOP_MEMORY'].split('#'):
							% if process:
								% usage, pid, name = process.split(' ', 2)
								{{name}} PID: {{pid}} - {{usage}}% <br />
							% end
						% end
				  </p>
              </div>
            </div>
          </article>
        </div>
      </div>
    </div>
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</div>


<script type="text/javascript">
/*
    document.addEventListener('DOMContentLoaded', function () {

  // Get all "navbar-burger" elements <progress class="progress" value="15" max="100">15%</progress>
  var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any nav burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them 
    $navbarBurgers.forEach(function ($el) {
      $el.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        var target = $el.dataset.target;
        var $target = document.getElementById(target);

        // Toggle the class on both the "navbar-burger" and the "navbar-menu"
        $el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
    });
  }

});
*/
</script>
</body>
</html>