get '/' do
  @category = Category.all
  erb :index
end

get '/category/:id' do
  @category = Category.where(id: params[:id]).first
  @articles = Article.where(category_id: params[:id])
  erb :"category/list_articles"
end

get '/article/new' do
  # @article = Article.new
  @article = Article.new(
    title: params[:title],
    description: params[:description]
    )
  erb :"article/new"
end

post '/article/' do
  p params
  @article = Article.new(
    title: params[:title],
    description: params[:description],
    category_id: params[:category_id]
    )
  if @article.save
    redirect "/article/#{@article.id}"
  else
    status 400
    erb :"article/new"
  end
end

get '/article/:id' do
  @article = Article.where(id: params[:id]).first
  erb :"article/list_description"
end

get '/article/:id/edit' do
  p @article = Article.where(id: params[:id]).first
  erb :"article/edit"
  # else
  #   status 404
  #   "Article Not Found"
  # end
end

put '/article/:id' do
  @article = Article.where(id: params[:id]).first
  @article.update(description: params[:description],
                  title: params[:title],
                  category_id: params[:category_id])

  redirect "/article/#{@article.id}"
end

delete '/article/:id' do
  p params
  @article = Article.where(id: params[:id]).first
  cat_id = @article.category_id
  if @article
    @article.destroy
    redirect "/category/#{cat_id}"
  else
    status 404
    'Article Not Found'
  end
end

