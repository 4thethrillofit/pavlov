Rails.application.config.middleware.use OmniAuth::Builder do
    provider :humanapi, ENV["HUMAN_API_APP_ID"],ENV["HUMAN_API_APP_SECRET"] 
end
