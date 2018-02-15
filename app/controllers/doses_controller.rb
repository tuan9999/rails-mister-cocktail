class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.create(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end





#     # 1st way
# def create
#   @dose = Dose.create(dose_params)
# end


#   def dose_params
#     params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
#   end


# # 2nd way

# def create
#   @dose =  Dose.new(dose_params)

#   @cocktail = Cocktail.find(params[:dose][:cocktail_id])
#   @dose.cocktail = @cocktail

#   @ingredient = Ingredient.find(params[:dose][:ingredient_id])
#   @dose.ingredient = @ingredient

#   if @dose.save
#     '.....'

# end


# def dose_params
#   params.require(:dose).permit(:description)
# end




















