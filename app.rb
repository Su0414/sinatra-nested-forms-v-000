require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
        erb :"/pirates/index"
    end

    get '/new' do
       erb :"/pirates/new"
    end

    post '/pirates' do
       #raise params.inspect
      @pirate = Pirate.create(params[:pirate["name"]], params[:pirate["weight"]], params[:pirate["height"]])
      @pirate.save
      @ship1 = Ship.create(params[:ship_name_1], params[:ship_type_1], params[:ship_booty_1])
      @ship.save
      @ship1 = Ship.all.first

      @ship2 = Ship.create(params[:ship_name_2], params[:ship_type_2], params[:ship_booty_2])
      @ship.save
      @ship2 = Ship.all.last

      @pirates = Pirate.all
      @ships = Ship.all

      erb :"/pirates/show"
    end

  end
end
