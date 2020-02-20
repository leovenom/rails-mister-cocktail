class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params_dose)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def delete
    @dose.delete
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
