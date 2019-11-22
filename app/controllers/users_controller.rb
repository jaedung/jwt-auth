class UsersController < ApplicationController
  def login
    token = Authentication.encode
    render json: { token: token }
  end

  def profile
    begin
      decoded_token = Authentication.decode("eyJhbGciOiJIUzI1NiJ9.eyJzZWNyZXQiOiI0Yzk4MDBmMTBhN2ZjYjE0ZDYwZmNkYWEwMGY4ZjYxMyIsImV4cCI6MTU3NDM5OTMxM30.qrCWE0c9Cydx1Wtd4RV7g_6857TwbY1HpoEdudtIG9U")
      render json: { decoded_token: decoded_token }
    rescue JWT::DecodeError => e
      render json: { message: e.message }, status: :unauthorized
    rescue JWT::VerificationError => e
      render json: { message: e.message }, status: :unauthorized
    rescue JWT::ExpiredSignature => e
      render json: { message: e.message }, status: :unauthorized
    end
  end
end
