module Api
  module V1
    module Authors
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        skip_before_action :authenticate_author!, only: :create

        # POST /api/v1/auth
        def create
          author = Author.new(sign_up_params)
          if author.save
            render json: {
              message: "Cadastro criado com sucesso",
              author: author
            }, status: :created
          else
            render json: {
              errors: author.errors.full_messages
            }, status: :unprocessable_entity
          end
        end

        private

        def sign_up_params
          params.require(:author).permit(:name, :email, :password)
        end
      end
    end
  end
end
