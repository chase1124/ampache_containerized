#!/bin/bash
# Set DB,USER,PASSWORD in Dockerfile ENV or runtime or envfile or compose file
if $(mysql -u root -e "show databases;" | grep $DB -q);
  then
  echo "Database exists"
else 
	if $(mysql -u root -e "create database $DB; grant all privileges on $DB.* to $USER@'%' identified by \"$PASSWORD\";")
    then
      echo "Created database: $DB and assigned permissions to $USER"
  fi
fi
