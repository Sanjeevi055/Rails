**Steps to run rails application on docker:**

Requirements: Docker and docker-compose need to be installed. 

If you already have a rails project, copy Dockerfile and docker-compose.file to your project folder and follow the steps below. 

**Step 1:**

To run the rails for the first time, the first command to run is “docker-compose build” inside of a project directory. 

Explanation: This is will install all the necessary setup needed say ruby, rails, Postgres, nodejs and all the other dependencies. 

**Step 2:**

Now project setup with all the dependencies installed and ready to create a database. 

To create a database run this command “docker-compose run web rake db:create” 

Note: To change the name of the database or change the username and password, move on to database.yml file inside the config folder.

Now that database is created, we need to start both application container rails and database container Postgres together. 

**Step 3:**

To run both the containers, run this command “docker-compose up -d” 
Note: To see the running logs use docker-compose up


Now your application is running on port 3000. Use http://localhost:3000 or http://yourip:3000


