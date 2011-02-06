class CreditEntriesController < ApplicationController
  def index
    @credit_entries = CreditEntry.all
  end

  def show
    @credit_entry = CreditEntry.find(params[:id])
  end

  def new
    @credit_entry = CreditEntry.new
  end

  def create
    @credit_entry = CreditEntry.new(params[:credit_entry])
    if @credit_entry.save
      flash[:notice] = "Successfully created credit entry."
      redirect_to @credit_entry
    else
      render :action => 'new'
    end
  end

  def edit
    @credit_entry = CreditEntry.find(params[:id])
  end

  def update
    @credit_entry = CreditEntry.find(params[:id])
    if @credit_entry.update_attributes(params[:credit_entry])
      flash[:notice] = "Successfully updated credit entry."
      redirect_to credit_entry_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @credit_entry = CreditEntry.find(params[:id])
    @credit_entry.destroy
    flash[:notice] = "Successfully destroyed credit entry."
    redirect_to credit_entries_url
  end
end
