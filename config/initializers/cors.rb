# config/initializers/cors.rb

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#     allow do
#       origins 'http://localhost:5173'  # Update this with your frontend origin
#       resource '/auth', headers: :any, methods: [:post], credentials: true
#     end
#   end
Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "*"
  
      resource "*",
        # headers: :any,
        # expose: ['access-token', 'expiry', 'token-type', 'uid', 'client', 'Authorization'],
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end
  
  