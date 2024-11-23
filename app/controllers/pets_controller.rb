class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    # emplty instance of a pet to help create the form
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet), notice: "Found pet saved"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet), notice: "Found pet updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.destroy
      redirect_to pets_path, status: :see_other
    else
      render :show, notice: "something went wrong"
    end
  end

  private
  # sanitises the params (i.e creates STRONG params)
  def pet_params
    params.require(:pet).permit(:date_found, :location)
  end
end
