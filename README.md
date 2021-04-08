# ampache_containerized
Project to run ampache containerized and with different platform support

Right now this is set to deploy a pre-installed ampache with an empty "catalog" of music
1. Put some mp3s in the local music/ folder
1a. Build the docker images (you can tag them with another image name but then you'll have to update the docker-composer.yml file)
docker build -t ampache_db:dev .
docker build -t amapche_nginx:4.4.1 -f nginxDockerfile .
2. Run docker compose up -d
3. Login to localhost (port 80) with admin:12test34
4. Click on the catalog icon (the 4th little icon in the row of 5 icons below the "A" in the top left
5. Click on "Show Catalogs" in the menu on the left
6. Click on "Go" in the middle right of the screen below "Actions" -> "Add"
7. Reset your database passwords and admin password but let's be realistic, you're just testing
8. You will lose your database and thus all data when you shut down your db container

Fresh Install
Don't COPY the cfg-installed file to the container image for nginxDockerfile
Don't do the line where you load the amapche.sql file in the Dockerfile
