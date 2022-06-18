# Test image

`docker build . --tag=backy:latest`
`docker run -v $(realpath datadir):/root/Backup --rm -it --env-file testrun.env backy:latest`
`docker run -v $(realpath datadir):/root/Backup --rm -it --env 'SCHEDULE=* * * * *' --env-file testrun.env backy:latest`

# Contributing

## Try inside container

`docker run -v $(realpath datadir):/root/Backup --rm -it --env-file testrun.env backy:latest irb`

require 'bundler'
Bundler.require(:default)
load 'lib/mysql_s3_model.rb'
create_model(params_here_see_run_rb)

## Try locally

`bin/console`

secrets = YAML::load(File.open("secrets.yml", "r:UTF-8", &:read))

create_model(
  model_name: secrets["model_name"],
  s3_key_id: secrets["s3_key_id"],
  s3_key: secrets["s3_key"],
  s3_bucket_name: secrets["s3_bucket_name"],
  s3_region: secrets["s3_region"],
  s3_path: secrets["s3_path"],
  db_host: secrets["db_host"],
  db_name: secrets["db_name"],
  db_user: secrets["db_user"],
  db_password: secrets["db_password"],
).perform!
