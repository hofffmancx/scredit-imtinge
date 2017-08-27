CarrierWave.configure do |config|
  if Rails.env.production?

    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'], # 你的 key

      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], # 你的 secret key

      region:                'ap-northeast-1' # 你的 S3 bucket 的 Region 位置

    }
    config.storage :fog
    config.fog_directory = ENV['AWS_BUCKET_NAME'] # 你设定的 bucket name

  else
    # config.storage :file
    # 1. Qiniuyun:   七牛云        122517637@qq.com      密码： dzl123456         华东区， 测试域名：oud39o8jh.bkt.clouddn.com
    CarrierWave.configure do |config|
      config.storage = :qiniu
      config.qiniu_access_key     = 'WHZpF03XPx0HFd-uRGz2HdAQVZmqiryB488Cxs68'
      config.qiniu_secret_key     = 'BATsHfpNAAk-KUcPUmLpbnVFHuuKj9OwpOXAw9-r'
      config.qiniu_bucket         = 'duzilong'
      config.qiniu_bucket_domain  = 'oud39o8jh.bkt.clouddn.com'
      config.qiniu_block_size     = 4 * 1024 * 1024
      config.qiniu_protocol       = 'http'
    end
  end
end
