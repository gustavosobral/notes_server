class ApplicationController < ActionController::API
  rescue_from Mongoid::Errors::DocumentNotFound, with: :record_not_found
  rescue_from Faraday::ConnectionFailed, with: :internal_server_error

  private

    def record_not_found
      render json: "{ \"error\": \"Record not found!\" }", status: :not_found
    end

    def internal_server_error
      render json: "{ \"error\": \"Internal server error!\" }", status: :internal_server_error
    end
end
