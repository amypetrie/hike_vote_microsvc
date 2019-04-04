class Api::V1::VotesController < ActionController::API

  def create
    Publisher.publish("votes", request.body.read())
    render status: 201
  end

end
