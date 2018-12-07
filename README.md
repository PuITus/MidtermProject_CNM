# Uber web system
A real-time web system with 4 main apps : Receiver, Identifier, Driver and Manager.
TECHNIQUES :
* VueJS, MySQL, NodeJS
* SOA RESTful API
* Realtime Web Application
* Google Maps API


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 
### Installing
first, config your database in: ./fn/mysql-db.js
* you can import my example database file: Uber_Database.sql
```
    	host: 'localhost',
    	user: 'root',
    	password: '',
    	database: 'uber'
```
then, install the project
```
npm install
cd Front-end/App
npm install
```

## Deployment

To run the back-end (restful server)

```
npm start
```

To run the front-end ()

```
cd Front-end/App
npm run dev
```
