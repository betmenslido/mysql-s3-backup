#!/usr/bin/env ruby

require "bundler"
Bundler.setup(:default).require(:default)

$:.unshift File.expand_path("./lib", __dir__)

puts "#{DateTime.now}: Backup starting..."

require 'mysql_s3_model'

create_model(
  model_name: ENV['MODEL_NAME'],

  s3_key_id: ENV['S3_KEY_ID'],
  s3_key: ENV['S3_KEY'],
  s3_bucket_name: ENV['S3_BUCKET_NAME'],
  s3_region: ENV['S3_REGION'],
  s3_path: ENV['S3_PATH'],

  db_name: ENV['DB_NAME'],
  db_host: ENV['DB_HOST'],
  db_user: ENV['DB_USER'],
  db_password: ENV['DB_PASSWORD'],
).perform!

puts "#{DateTime.now}: Backup completed..."
