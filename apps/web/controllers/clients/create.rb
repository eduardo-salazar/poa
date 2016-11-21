module Web::Controllers::Clients
  class Create
    include Web::Action
    expose :clients
    def call(params)
      @clients = ClientRepository.new.create(params[:client])
      redirect_to '/clients'
    end
  end
end
