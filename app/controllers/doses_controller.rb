class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(params_dose)
    if @dose.save
      redirect_to @dose
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
    params.require(:dose).permit(:cocktail, :ingredients_id)
  end
end
