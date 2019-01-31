class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # index action

    get '/recipes' do
      @recipes = Recipe.all
      erb :index
    end

    # new action
    get '/recipes/new' do
      erb :new
    end

    #create action

    post '/recipes' do
      @recipe = Recipe.create(params)
      redirect "/recipes/#{@recipe.id}"
      erb :new
    end

  # show action

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # edit action
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  # update action
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  # delete action
  delete "/recipes/:id" do
    Recipe.destroy(params[:id])
    redirect to "/recipes"
  end


end
