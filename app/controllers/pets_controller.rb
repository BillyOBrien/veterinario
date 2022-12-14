class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  #Agrupamos los metodos por CRUD
  #CREATE
  
  # GET /pets/new
  def new
    @client = Client.find params[:client_id]
    @pet = Pet.new
  end

  # POST /pets
  # POST /pets.json
  def create
    @client = Client.find params[:client_id]
    @pet = Pet.new(pet_params)
    @pet.client = @client
    respond_to do |format|
      if @pet.save
        format.html { redirect_to client_pet_path(@client, @pet), notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: client_pet_path(@client, @pet) }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  #READ

  # GET /pets
  # GET /pets.json
  def index
    @client = Client.find params[:client_id]
    @pets = @client.pets
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @client = Client.find params[:client_id]
  end

  #UPDATE

  # GET /pets/1/edit
  def edit
    @client = Client.find params[:client_id]
    @pets = Pet.find params[:id]
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    @client = Client.find params[:client_id]
    @pets = Pet.find params[:id]
    respond_to do |format|
      if @pet.update(pet_params.merge(client: @client))
        format.html { redirect_to client_pet_path(@client, @pet), notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  #DELETE

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pets = Pet.find params[:id]
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to client_pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :race, :birthdate)
    end
end
