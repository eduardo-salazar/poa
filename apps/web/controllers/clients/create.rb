module Web::Controllers::Clients
  class Create
    include Web::Action
    expose :clients

    params do
        required(:client).schema do
          required(:name).filled(:str?)
          required(:desc).filled(:str?)
          required(:location).filled(:str?)
        end
    end

    def call(params)
      if params.valid?
        @clients = ClientRepository.new.create(params[:client])
        redirect_to '/clients'
      else
        self.status = 422
      end
    end
  end
end
