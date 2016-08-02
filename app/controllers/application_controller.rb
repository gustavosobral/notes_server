class ApplicationController < ActionController::API
  rescue_from Mongoid::Errors::DocumentNotFound, with: :record_not_found
  rescue_from Faraday::ConnectionFailed, with: :internal_server_error
  rescue_from Elasticsearch::Transport::Transport::Errors::BadRequest, with: :invalid_query

  private

    def record_not_found
      render json: "{ \"error\": \"Record not found!\" }", status: :not_found
    end

    def internal_server_error
      render json: "{ \"error\": \"Internal server error!\" }", status: :internal_server_error
    end

    def invalid_query
      render json: "{ \"error\": \"Invalid query!\" }", status: :bad_request
    end
end
