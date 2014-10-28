Docker image to run laravel with PHP and nginx

Based on image luis/nginx-php, this image only adds a new nginx virtual host file and downloads laravel using composer.

# Example using fig

	web:
	  image: luis/laravel-nginx
	  volumes:
	    - "./:/var/www"
	    - "/var/log/myapp:/var/log/supervisor"
	  ports:
	    - "80:80"
	  links:
	    - "mysql:mysql"
