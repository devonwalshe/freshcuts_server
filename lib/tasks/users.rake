namespace :users do
    
    desc "Adds an api token to a user email"
    task :add_api_token_to_user, [:email] => :environment do |t, args|
        u = User.find_by(email: args[:email])
        u.api_token = SecureRandom.base64(32)
        puts u.api_token
        u.save
    end
end

