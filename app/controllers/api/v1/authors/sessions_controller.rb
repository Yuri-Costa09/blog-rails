# frozen_string_literal: true

module Api
  module V1
    module Authors
      class SessionsController < Devise::SessionsController
        respond_to :json
        skip_before_action :authenticate_author!, only: :create

        # POST /api/v1/auth/login
        def create
          author = Author.find_by(email: params[:author][:email])

          if author_authenticated?(author)
            token = generate_jwt_token(author)
            render_success_response(author, token)
          else
            render_error_response
          end
        end

        private

        # Validate author exists and password is correct
        def author_authenticated?(author)
          author&.valid_password?(params[:author][:password])
        end

        # Generate JWT token with author information
        def generate_jwt_token(author)
          payload = {
            sub: author.id,           # Subject (user ID)
            jti: author.jti,          # JWT ID (for token revocation)
            exp: 1.day.from_now.to_i  # Expiration time
          }
          JWT.encode(payload, ENV["JWT_SECRET"])
        end

        def render_success_response(author, token)
          response.set_header("Authorization", "Bearer #{token}")
          render json: {
            message: "Login efetuado com sucesso",
            author: author,
            token: token
          }, status: :ok
        end

        def render_error_response
          render json: {
            message: "Credenciais inválidas"
          }, status: :unauthorized
        end
      end
    end
  end
end
