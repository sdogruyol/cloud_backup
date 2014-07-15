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

## Installation

    gem install cloud_backup

## Usage

### For File Backup

    cloud_backup pat/to/your/file

### For Database Backup

You need to have you Database configured.

    cloud_backup

##Planned

- Add more databases (E.g Postgres)
- Add more cloud providers (E.g Google Drive, S3)
