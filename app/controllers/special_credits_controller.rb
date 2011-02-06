class SpecialCreditsController < ApplicationController
  def index
    @special_credits = SpecialCredit.all
  end

  def show
    @special_credit = SpecialCredit.find(params[:id])
  end

  def new
    @special_credit = SpecialCredit.new
  end

  def create
    @special_credit = SpecialCredit.new(params[:special_credit])
    if @special_credit.save
      flash[:notice] = "Successfully created special credit."
      redirect_to @special_credit
    else
      render :action => 'new'
    end
  end

  def edit
    @special_credit = SpecialCredit.find(params[:id])
  end

  def update
    @special_credit = SpecialCredit.find(params[:id])
    if @special_credit.update_attributes(params[:special_credit])
      flash[:notice] = "Successfully updated special credit."
      redirect_to special_credit_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @special_credit = SpecialCredit.find(params[:id])
    @special_credit.destroy
    flash[:notice] = "Successfully destroyed special credit."
    redirect_to special_credits_url
  end
end
