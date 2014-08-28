class EndpointsController < ApplicationController
  responders :flash, :collection

  before_action :authenticate_user!

  expose(:endpoints) { current_user.endpoints }
  expose(:endpoint, attributes: :endpoint_params)

  def index
  end

  def new
  end

  def create
    endpoint.save
    respond_with endpoint
  end

  def edit
  end

  def update
    endpoint.save
    respond_with endpoint
  end

  private

  def endpoint_params
    params.require(:endpoint).permit(:repost_url)
  end
end
