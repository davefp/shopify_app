Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shopify, Rails.application.config.shopify.api_key, Rails.application.config.shopify.secret,
    :scope => 'read_products',
    :setup => lambda { |env| params = Rack::Utils.parse_query(env['QUERY_STRING'])
                             env['omniauth.strategy'].options[:client_options][:site] = "https://#{params['shop']}" }
end