class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]


def index
  @cocktails = Cocktail.all
end

def show
end

def new
  @cocktail = Cocktail.new
end

def create
  @cocktail = Cocktail.new(cocktail_params)

  respond_to do |format|
    if @cocktail.save
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
      else
        format.html { render :new }
    end
  end
end

def destroy
  @cocktail.destroy
  redirect_to cocktails_path
end

private

def set_cocktail
  @cocktail = Cocktail.find(params[:id])
end

def cocktail_params
  params.require(:cocktail).permit(:name)
end

end
