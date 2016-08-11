class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    respond_to |format|
      if @cocktail.save
        redirect_to cocktail_path(@cocktail), notice: 'Cocktail created!'
      else
        render :new
      end
    end

  private

  def cocktail_params
    params.require(:cocktails).permit(:name)
  end
end
