class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @country }
    end
  end

  # GET /countries/new
  def new
    @country = Country.new
    respond_to do |format|
      format.html { render :new }
      format.json { render json: @country }
    end
  end

  # GET /countries/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @country }
    end
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json {  render json: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json {  render json: @country}
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      hash = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      hash.slice!(:id,:title,:code)
      hash
    end
end
