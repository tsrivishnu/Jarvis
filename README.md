# Jarvis

Simple ruby application to server requests from API.ai (Dialogue Flow) for the
Jarvis agent that helps me automate/control the followingstuff at home.

* DigitalOcean
  * VPN server

## Setup

### Requirements
The instructions below require the following. However, this is a simple ruby app and can be run
without the below requriements.
* Docker
* [Docker compose](https://docs.docker.com/compose/)
> Note: All the instructions below assume you cloned the respository and are in the project's directory.

#### Install gems

Run the following to install the required gems:

   ```bash
   docker-compose run app bundle install
   ```
#### Set configuration

Use the sample configuration file to set the required configuration variables in `config/application.yml`.
 ```bash
 cp config/application.yml.example config/application.yml
 # Edit +application.yml+ to set the correct values to the variables
 ```

#### SSL Certificates

Dialogflow fullfilement server backend works only with HTTPS. The NGINX for
this project it setup to serve the app via HTTPS but the certificates are to
be generated and added to the project for nginx to pick it up.
The files are to be placed in:
```bash
nginx/ssl/app.pem # Public certificate file.
nginx/ssl/app.privkey.pem # The private key for the certficate.
```

## Run the app

Once the above setup it done, you can run the app with
```bash
docker-compose up
```

This will start the web server inside the docker container and expose it on port `4567`
of your machine.

> Note: If you are not using `crane` and `docker`, simple run `bundle exec ruby app.rb` to start
the server. However, the server will start listeing for requests on port `4567`. Update the urls
below accordingly.

## General guidelines

* **Configuration values**: These can be changed as needed in the `config/application.yml` file.


