class PostsController < ApplicationController

    before do
        require_login
    end

    ## CRUD-Read, show all and show all by type tag
    get "/" do
    @posts = Post.order("created_at DESC")
    @title = "Welcome."
    erb :"homepage"
  end

  # create new post
  get "/posts/create" do
    @title = "Create post"
    @post = Post.new
    erb :"posts/create"
  end
  post "/posts" do
    redirect "posts/create", :error => 'Invalid captcha' unless captcha_pass?
    @post = Post.new(params[:post])
    if @post.save
      redirect "posts/#{@post.id}", :notice => 'Congrats! Love the new post. (This message will disappear in 4 seconds.)'
    else
      redirect "posts/create", :error => 'Something went wrong. Try again. (This message will disappear in 4 seconds.)'
    end
  end

  # view post
  get "/posts/:id" do
    @post = Post.find(params[:id])
    @title = @post.title
    erb :"posts/view"
  end

  # edit post
  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
    @title = "Edit Form"
    erb :"posts/edit"
  end
  put "/posts/:id" do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    redirect "/posts/#{@post.id}"
  end
end
