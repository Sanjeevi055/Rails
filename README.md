![Screenshot from 2021-09-12 21-23-31](https://user-images.githubusercontent.com/90387133/133030582-e83dbf25-45b1-4894-a824-d20950c74951.png)
**Rails application on Docker**


**Dockerfile explanation:**

Firstly i used ruby on alpine and installed rails and nodejs and other dependencies. 

As a second step i copied Gemfile, Gemfile.lock, Rakefile, yarn.lock into the image. 

Then i installed yarn and run yarn install

After yarn i used bundle install to install dependencies. 

Lastly i used rails s as runtime command. 

**Explanation of docker-compose-file:**

I have two services called db and web.

For db service i use postgres:alphine image 
I am using postgresql directory as host directory of database and /var/lib/postgres/data as postgres directory insdie docker.
I haven't been able to use token as crendential instead of password as a environment variable.

For web service I am running whatever the Dockerfile built and created for me with the rails s command binding to 0.0.0.0 and port 3000. 

**Issues i couldn't able to solve:**

I am able to get the docker-compose up without a problem but i think i haven't configured database correctly.
I am getting this page instead of expected rails home page. 
![Screenshot from 2021-09-12 21-23-50](https://user-images.githubusercontent.com/90387133/133030521-863029c6-ac72-4fa6-9f90-15a0925fdc46.png)

