class UsersController < ApplicationController
  
  def index
    @users = User.order('created_at DESC').page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.js { render :action => 'new'}
    end
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:success] = "A new user was added."
        puts "saving, and rendering restore.js"
        format.js {render :action => 'restore'}
      else
        flash[:error] = "There was a problem creating a new user."
        render :new
      end
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

 end