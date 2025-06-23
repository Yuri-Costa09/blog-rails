module Api
  module V1
    module Authors
      class RegistrationsController < Devise::RegistrationsController
        include RackSessionFix
        respond_to :json

        private

        def sign_up_params
          params.require(:author).permit(:name, :email, :password, :password_confirmation)
        end

        def account_update_params
          params.require(:author).permit(:name, :email, :password, :password_confirmation, :current_password)
        end

        def respond_with(resource, _opts = {})
          if resource.persisted?
            render json: {
              message: "Cadastro criado com sucesso",
              data: AuthorSerializer.new(resource).serializable_hash[:data][:attributes]
            }, status: :created
          else
            render json: {
              message: "Erro ao criar cadastro #{resource.errors.full_messages.to_sentence}"
            }, status: :unprocessable_entity
          end
        end
      end
    end
  end
end
