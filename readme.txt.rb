# Test image

$ docker build . --tag=backy:latest
$ docker run --rm -it --env-file testrun.env backy:latest
$ docker run --rm -it --env 'SCHEDULE=* * * * *' --env-file testrun.env backy:latest

# Contributing

## Try inside container:

docker run --rm -it backy:latest irb
require 'bundler'
Bundler.setup.require
load 'lib/mysql_s3_model.rb'

## Try locally:

$ bin/console

require 'mysql_s3_model'

secrets = YAML::load(File.open("secrets.yml", "r:UTF-8", &:read))

create_model(
  model_name: "mybackup",
  s3_key_id: secrets["key_id"],
  s3_key: secrets["key"],
  s3_bucket_name: "kopiena-db-backups",
  s3_region: "eu-west-1",
  s3_path: "",
  db_name: "kopiena_dev",
  db_host: "host.docker.internal",
  db_user: "kopiena_dev",
  db_password: nil,
).perform!
