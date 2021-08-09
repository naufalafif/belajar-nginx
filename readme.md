#### Nginx Configuration

1) sites-available is where configuration are defined
2) sites-enable is where nginx look for configuration. so to make configuration on sites-available work, u need to create link of the configuration on sites-enable dir

#### Config Example
Simple Config
```nginx
http {
  server {
    listen 8080;
    root /var/www/belajar;
    
    ## forbid all url that contain string positive
    location ~ positive {
    	return 403;
    }
    
    ## get images from home/pictures for path /images2
    location /images2 {
    	root /home/aqi/Pictures;
    }
    
  }
  
  ## aliases, redirect request to port 8080
  server {
	listen 8888;
	
	location / {
		proxy_pass http://localhost:8080;
	}
  }

}

events {}
```

Load Balancing
```nginx
http {

  upstream allbackend {
    server 127.0.0.1:8081;
    server 127.0.0.1:8082;
    server 127.0.0.1:8083;
  }

  server {
    listen 8080;
    root /var/www/belajar;


    location / {
      proxy_pass http://allbackend/;
    }

  }
}
events {}
```

#### Example 
1) Simple App HTTPS [open](examples/simple_app_https)
2) Load Balancing [open](examples/load_balancing)
