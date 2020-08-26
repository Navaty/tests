class TcategoriesController < ApplicationController
  before_action :set_tcategory, only: [:show, :edit, :update, :destroy]

  # GET /tcategories
  # GET /tcategories.json
  def index
    @tcategories = Tcategory.all
  end

  # GET /tcategories/1
  # GET /tcategories/1.json
  def show
  end

  # GET /tcategories/new
  def new
    @tcategory = Tcategory.new
  end

  # GET /tcategories/1/edit
  def edit
  end

  # POST /tcategories
  # POST /tcategories.json
  def create
    @tcategory = Tcategory.new(tcategory_params)

    respond_to do |format|
      if @tcategory.save
        format.html { redirect_to @tcategory, notice: 'Tcategory was successfully created.' }
        format.json { render :show, status: :created, location: @tcategory }
      else
        format.html { render :new }
        format.json { render json: @tcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tcategories/1
  # PATCH/PUT /tcategories/1.json
  def update
    respond_to do |format|
      if @tcategory.update(tcategory_params)
        format.html { redirect_to @tcategory, notice: 'Tcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @tcategory }
      else
        format.html { render :edit }
        format.json { render json: @tcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tcategories/1
  # DELETE /tcategories/1.json
  def destroy
    @tcategory.destroy
    respond_to do |format|
      format.html { redirect_to tcategories_url, notice: 'Tcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tcategory
      @tcategory = Tcategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tcategory_params
      params.require(:tcategory).permit(:title, :description)
    end
end
