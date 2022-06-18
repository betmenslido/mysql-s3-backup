def create_model(
      model_name:,
      db_name:,
      s3_key_id:,
      s3_key:,
      s3_bucket_name:,
      s3_region:,
      s3_path:,
      db_host:,
      db_user:,
      db_password:
    )
  Backup::Model.new(model_name, "My Backup") do
    database Backup::Database::MySQL do |db|
      db.name               = db_name

      db.username           = db_user
      db.password           = db_password
      db.host               = db_host

      db.skip_tables        = ['mysql.event']
      db.additional_options = ['--single-transaction', '--quick']
    end

    compress_with Backup::Compressor::Gzip

    store_with Backup::Storage::S3, :server_01 do |s3|
      s3.storage_class      = :reduced_redundancy
      s3.access_key_id      = s3_key_id
      s3.secret_access_key  = s3_key
      s3.region             = s3_region
      s3.bucket             = s3_bucket_name
      s3.path               = s3_path
      s3.keep               = 8
    end
  end
end
