class UsersController < ApplicationController

  def index
    client_params = {
                      user_name: params[:user_name],
                      name: params[:name],
                      city: params[:city],
                      state: params[:state],
                      mini_bio: params[:mini_bio],
                      age: params[:age]
    }

    response = Unirest.get(
                            "http://localhost:3000/api/users",
                            parameters: client_params )

    @users = response.body
    render 'index.html.erb'
  end


  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                    username: params[:username],
                    name: params[:name],
                    city: params[:city],
                    state: params[:state],
                    mini_bio: params[:mini_bio],
                    age: params[:age]
                    }

    response = Unirest.post(
                          "http://localhost:3000/api/users",
                          parameters: client_params
                          )
  
  if response.code == 200
      flash[:success] = 'Successfully created profile!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid information! Please try again!'
      redirect_to '/signup'
    end
  end

  def show
    response = Unirest.get("http://localhost:3000/api/users/#{params['id']}")
    @user = response.body
    render 'show.html.erb'
  end
end
