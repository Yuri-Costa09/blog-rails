# frozen_string_literal: true

module Api
  module V1
    module Authors
      class SessionsController < ApplicationController
        include RackSessionFix
        skip_before_action :authenticate_author!, only: [ :create ]

        def create
          author = Author.find_by(email: params[:author][:email])

          if author&.valid_password?(params[:author][:password])
            render json: {
              message: "Login realizado com sucesso",
              data: AuthorSerializer.new(author).serializable_hash[:data][:attributes]
            }, status: :ok
          else
            render json: {
              message: "Email ou senha inválidos"
            }, status: :unauthorized
          end
        end

        def destroy
          if current_author
            # invalidar jwt
            current_author.update!(jti: SecureRandom.uuid)

            render json: {
              message: "Logout realizado com sucesso"
            }, status: :ok
          else
            render json: {
              message: "Não foi possivel achar uma sessão ativa"
            }, status: :unauthorized
          end
        end
      end
    end
  end
end
