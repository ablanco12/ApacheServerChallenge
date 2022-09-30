# ApacheServerChallenge

create a Dockerfile within that folder with the vi editor: 

$ vi Dockerfile

Paste the following content in the Dockerfile:

FROM ubuntu 
RUN apt update
RUN apt install –y apache2 
RUN apt install –y apache2-utils 
RUN apt clean 
RUN apt upgrade -y
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]

To exit the editor, press ESC then :wq! then ENTER.

Tag and build the Docker Image:

docker build -t apache_image:1.0 .

The docker images command gives us a list of all the images that are built.

Run 'docker images' to verify the image was created.

Once image has been built, run the image as a container locally:

We are going to run the container in detached mode so that is runs continuously in the background. Make sure to include -d in the 'docker run' command.

- To be able to host the Apache Server, we provide the port 80 (HTTP) for the same. Use -p 80:80 to have the server running on localhost.

$ docker run --name myapache -d -p 80:80 apache_image:1.0

To test, you can go to your browser and type 'localhost'

You should see an Apache2 Ubuntu Default Page. This is the 'index.html' that is located at /var/www/html/index.html .

In order to change that file, you'll need to copy another file to replace it.

You can do this by creating the file first,

ex. 
$ touch index.html

then add an html doc with your own changes by using the vi editor.

$ vi index.html

you can then go back to your Dockerfile and write the command that will copy your newly created index.html file over to the /var/www/html/ directory. 

FROM ubuntu
RUN apt update
RUN apt install –y apache2
RUN apt install –y apache2-utils
RUN apt clean
RUN apt upgrade -y
COPY index.html /var/www/html/index.html
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]

And since there is already a file with that name.. it will get replaced.

Lastly, you are going to need to rebuild your image.


