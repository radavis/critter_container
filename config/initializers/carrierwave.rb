CarrierWave.configure do |config|

  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      =>  'AKIAIRAZLKVYMSRHEQKA',
      :aws_secret_access_key  => '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',
      # :region                 => 
      :endpoint               => 'https://s3.amazonaws.com/'
    }
    config.fog_directory = 'crittercontainer'
  end
end