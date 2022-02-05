docker build . --tag=backy:latest

# try inside container

docker build . --tag=backy:latest
docker run --rm -it backy:latest /bin/ash
docker run --rm -it backy:latest irb
require 'bundler'
Bundler.setup
Bundler.require
load 'lib/mysql_s3_model.rb'

# Playground

$ bin/console

load 'mysql_s3_model.rb'
model = create_model(
  model_name: "mymodel",
  database_name: "kopiena_dev",
  s3_key_id: "xxx",
  s3_key: "xxx",
  s3_bucket_name: "kopiena-db-backups",
  s3_region: "eu-west-1",
  s3_path: "",
  db_host: "host.docker.internal",
  db_user: "kopiena_dev",
  db_password: nil,
)

model.perform!
