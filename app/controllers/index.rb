get '/' do
  # Look in app/views/index.erb
  #show all catergories
  @category_list = Category.all
  erb :index
end

get '/category/:id' do
  #category
  #list posts
  #create a post
  @category = Category.find_by_id(params[:id])
  @posts = Post.where(:category_id => params[:id])
  @all_posts = Post.all

  erb :category
end

post '/category/:id' do
  @category = Category.find_by_id(params[:id])
  @posts = Post.where(:category_id => params[:id])
  @new_post = Post.create(:title => params[:title], :price => params[:price], :location => params[:location], :category_id => params[:id])
  erb :category
end

get '/post/:id' do
  #list post info
  #edit post
  @post = Post.find_by_id(params[:id])
  erb :post
end

get '/post_create' do 
  @post = Post.create(params)
  erb :create
end

get '/edit_post/:id' do
  #edit an existing post
  @post = Post.find_by_id(params[:id])
  erb :edit_post
end

post '/edit_post/:id' do
  @post = Post.update(params[:id], :title => params[:title], :price => params[:price], :location => params[:location])
  redirect to("/post/#{@post.id}")
end
