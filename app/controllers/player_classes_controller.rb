class PlayerClassesController < ApplicationController
  def index
    @player_classes = PlayerClass.all
  end

  def show
    @player_class = PlayerClass.find(params[:id])
  end

  def new
    @player_class = PlayerClass.new
  end

  def create
    @player_class = PlayerClass.new(params[:player_class])
    if @player_class.save
      flash[:notice] = "Successfully created player class."
      redirect_to @player_class
    else
      render :action => 'new'
    end
  end

  def edit
    @player_class = PlayerClass.find(params[:id])
  end

  def update
    @player_class = PlayerClass.find(params[:id])
    if @player_class.update_attributes(params[:player_class])
      flash[:notice] = "Successfully updated player class."
      redirect_to player_class_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @player_class = PlayerClass.find(params[:id])
    @player_class.destroy
    flash[:notice] = "Successfully destroyed player class."
    redirect_to player_classes_url
  end
end
