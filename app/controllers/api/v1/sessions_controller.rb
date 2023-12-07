class Api::V1::SessionsController < ApplicationController
    respond_to :json
    
    def create
        super do |resource|
            render json: { user: resource, token: resource.authentication_token }
            return
        end
    end

    def destroy
        super
    end
end
