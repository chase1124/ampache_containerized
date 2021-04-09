# ampache_containerized
Project to run ampache containerized and with different platform support

Make sure you have Docker compose installed (a part of Docker Desktop now)
You will need to do a fresh install because the ampache config file has a reference to a "secret" which I guess uniquely identifies it to the database
The easiest thing to do would be to bring the application up, log into the ampache_nginx docker and delete the config file, run the web installer, then save the new config

Pre-Install
Download the source files (the ampache github project) into the right dirctory
1. cd ampache_nginx/source
2. git clone https://github.com/ampache/ampache.git

Install
1. Edit docker-compose.yaml to look at the environment variables for the ampache_db which describes how it will init the db and create a db user
2. Put some music in amapche_nginx/music/
3. docker compose build 
4. docker compose up -d
5. docker exec -it ampache_nginx /bin/bash
5. ampache_nginx> rm /var/www/html/ampache/config/ampache.cfg.php
6. run the web installer from your local computer: http://localhost/install.php
7. Installer notes: the database network name is the same name as the "container_name" in docker-compose.yml. The db user and password is passed into the environmental variables of docker-compose.yml and when you build the container image it should have created the db and used those credentials
8. Once installed you need to copy the config file you deleted back out of the container and rebuild the container
9. docker copy apache_nginx:/var/www/html/ampache/config/ampache.cfg.php ampache_nginx/
10. docker compose build
11. Restart and check if you want
12. docker compose down && docker compose up -d
13. When you first login to your ampache server it will ask you to create a catalog. Create a "local" type catalog and by default the container build copies music you put into ampache_nginx/music/* into /ampache/music/ on the container

---
OLD INSTALLATION NOTES BELOW
Right now this is set to deploy a pre-installed ampache with an empty "catalog" of music
1. Put some mp3s in the local music/ folder
2. Build the docker images (you can tag them with another image name but then you'll have to update the docker-composer.yml file)

<code>docker build -t ampache_db:dev .</code>

<code>docker build -t amapche_nginx:4.4.1 -f nginxDockerfile .</code>

3. Run docker compose up -d
4. Login to localhost (port 80) with admin:12test34
5. Click on the catalog icon (the 4th little icon in the row of 5 icons below the "A" in the top left
6. Click on "Show Catalogs" in the menu on the left
7. Click on "Go" in the middle right of the screen below "Actions" -> "Add"
8. Reset your database passwords and admin password but let's be realistic, you're just testing
9. You will lose your database and thus all data when you shut down your db container

Fresh Install
- Don't COPY the cfg-installed file to the container image for nginxDockerfile
- Don't do the line where you load the amapche.sql file in the Dockerfile
