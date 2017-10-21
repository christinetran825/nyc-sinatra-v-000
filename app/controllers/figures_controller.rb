class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.new
    @figure.name = params[:figure][:name]
    # binding.pry
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title])
    elsif !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark])
    else
      #? params[:title][:name].empty? params[:landmark][:name].empty?
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
  #
  # post '/figures/:id' do
  #   redirect "/figures/#{@figure.id}"
  # end
  #
  # patch '/figures/:id/edit' do
  #   @figure = Figure.find(params[:id])
  #   erb :'/figures/edit'
  # end
  #

end
