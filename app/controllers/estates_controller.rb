class EstatesController < ApplicationController
  before_action :set_estate, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! , only: [:new, :create]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def require_permission
    if current_user != Estate.find(params[:id]).user
      redirect_to root_path
    end

  end

 def buy
    @estate = Estate.find(params[:id])
    @estate.status = 'niedostepny'
 end



  # GET /estates
  # GET /estates.json
  def index
    @estates = Estate.all
    respond_to do |format|
      format.html
      format.csv { send_data @estates.to_csv }
      format.xls { send_data @estates.to_csv(col_sep: "\t") }
    end
  end

  # GET /estates/1
  # GET /estates/1.json
  def show
    @estate = Estate.find(params[:id])
    @estates = Estate.all
    @hash = Gmaps4rails.build_markers(@estates) do |estate, marker|
    marker.lat estate.latitude
    marker.lng estate.longitude
    marker.infowindow estate.description
end
  end

  # GET /estates/new
  def new
    @estate = Estate.new
  end

  # GET /estates/1/edit
  def edit
  end

  # POST /estates
  # POST /estates.json

  def create
    @estate = Estate.new(estate_params)
    @estate.user_id = current_user.id

    respond_to do |format|
      if @estate.save
        format.html { redirect_to @estate, notice: 'Nieruchomość została dodana.' }
        format.json { render :show, status: :created, location: @estate }
      else
        format.html { render :new }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estates/1
  # PATCH/PUT /estates/1.json
  def update
    respond_to do |format|
      if @estate.update(estate_params)
        format.html { redirect_to @estate, notice: 'Nieruchomość została zaktualizowana.' }
        format.json { render :show, status: :ok, location: @estate }
      else
        format.html { render :edit }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estates/1
  # DELETE /estates/1.json
  def destroy
    @estate.destroy
    respond_to do |format|
      format.html { redirect_to estates_url, notice: 'Usunięto' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estate
      @estate = Estate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estate_params
      params.require(:estate).permit(:image, :image_cache, :title, :price, :description, :address)
    end
end
