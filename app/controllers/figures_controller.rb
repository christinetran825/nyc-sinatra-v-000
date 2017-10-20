class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:name])
    @landmark = Landmark.create(name: params[:name], year_completed: params[:year_completed])
    @title = Title.create(params[:name])
    # if !params[:landmark][:figure].empty?
    #    @figure.landmarks << Landmark.create(name: params[:landmark])
    # end
    # @figure.save

    redirect to "/figures/#{@figure.id}"
  end



  post '/figures/:id' do
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end


end
