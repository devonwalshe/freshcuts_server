class AffiliateproductsController < ApplicationController
  before_action :set_affiliateproduct, only: [:show, :edit, :update, :destroy]

  # GET /affiliateproducts
  # GET /affiliateproducts.json
  def index
    @affiliateproducts = Affiliateproduct.all
  end

  # GET /affiliateproducts/1
  # GET /affiliateproducts/1.json
  def show
  end

  # GET /affiliateproducts/new
  def new
    @affiliateproduct = Affiliateproduct.new
  end

  # GET /affiliateproducts/1/edit
  def edit
  end

  # POST /affiliateproducts
  # POST /affiliateproducts.json
  def create
    @affiliateproduct = Affiliateproduct.new(affiliateproduct_params)

    respond_to do |format|
      if @affiliateproduct.save
        format.html { redirect_to @affiliateproduct, notice: 'Affiliateproduct was successfully created.' }
        format.json { render :show, status: :created, location: @affiliateproduct }
      else
        format.html { render :new }
        format.json { render json: @affiliateproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affiliateproducts/1
  # PATCH/PUT /affiliateproducts/1.json
  def update
    respond_to do |format|
      if @affiliateproduct.update(affiliateproduct_params)
        format.html { redirect_to @affiliateproduct, notice: 'Affiliateproduct was successfully updated.' }
        format.json { render :show, status: :ok, location: @affiliateproduct }
      else
        format.html { render :edit }
        format.json { render json: @affiliateproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliateproducts/1
  # DELETE /affiliateproducts/1.json
  def destroy
    @affiliateproduct.destroy
    respond_to do |format|
      format.html { redirect_to affiliateproducts_url, notice: 'Affiliateproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_affiliateproduct
      @affiliateproduct = Affiliateproduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def affiliateproduct_params
      params.fetch(:affiliateproduct, {})
    end
end
