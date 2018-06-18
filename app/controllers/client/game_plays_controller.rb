class Client::GamePlaysController < ApplicationController

  def index
    client_params = {
                      user_id: params[:user_id],
                      score: params[:score]
    }

    response = Unirest.get(
                            "http://localhost:3000/api/game_plays",
                            parameters: client_params )

    @game_plays = response.body
    render 'index.html.erb'
  end

end
