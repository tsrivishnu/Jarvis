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
* [Crane](https://www.craneup.tech) version 3 and above.
   * Installation:
      ```bash
       bash -c "`curl -sL https://raw.githubusercontent.com/michaelsauter/crane/v3.4.1/download.sh`" && \
       mv crane /usr/local/bin/crane
      ```

> Note: If you choose to run the app without above requirements, simply remove the `crane run app`
from the below commands

> Note: All the instructions below assume you cloned the respository and are in the project's directory.

#### Install gems

Run the following to install the required gems:

   ```bash
   crane run app bundle install
   ```
#### Set configuration

Use the sample configuration file to set the required configuration variables in `config/application.yml`.
 ```bash
 cp config/application.yml.example config/application.yml
 # Edit +config.yml+ to set the correct values to the variables
 ```

## Run the app

Once the above setup it done, you can run the app with
```bash
crane run app
```

This will start the web server inside the docker container and expose it on port `4567`
of your machine.

> Note: If you are not using `crane` and `docker`, simple run `bundle exec ruby app.rb` to start
the server. However, the server will start listeing for requests on port `4567`. Update the urls
below accordingly.

## General guidelines

* **Configuration values**: These can be changed as needed in the `config.yml` file.


