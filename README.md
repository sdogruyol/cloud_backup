## What is it?

A tiny Ruby program to dump your Database and store it in the Cloud.

#### Currently supported DBs
- MySQL

#### Currently supported Clouds
- Dropbox

##Requirements

The only requirements are working a Ruby installation and RubyGems.

For Dropbox : You also need to have a working Dropbox account of your own and need to create an app for yourself.

##Configuration

All the configuration including your Dropbox app token and secret is done via settings.yml

##How to

Just clone this repo

git clone https://github.com/Sdogruyol/dump-to-cloud

And bundle.

https://github.com/Sdogruyol/dump-to-cloud

Then

ruby dump.rb

##Planned
- Add more databases (E.g Postgres)
- Add more cloud providers (E.g Google Drive, S3)