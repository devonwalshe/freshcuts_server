class ApiController < ApplicationController
    protect_from_forgery with: :null_session 
    before_filter :destroy_session, :parse_request, :authenticate_user_from_token!

    def process_crawl
        #validate the keys in the json array
        
        #parse objects and save them to the db
        render json: [@user, @json, "whoohoo"]
    end
    
    private
       def authenticate_user_from_token!
         if !@json['api_token']
           render nothing: true, status: :unauthorized
         else
           @user = nil
           User.find_each do |u|
             if Devise.secure_compare(u.api_token, @json['api_token'])
               @user = u
             end
           end
         end
       end

       def parse_request
         @json = JSON.parse(request.body.read)
       end

       def destroy_session
          request.session_options[:skip] = true
       end
end
