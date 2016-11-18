OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['1765565120358768'], ENV['f5c990ffb63e29417c2737ae92a2883a']
end