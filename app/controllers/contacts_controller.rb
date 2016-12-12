class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html { render :new }
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @contact }
    end
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render json: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render json: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    hash = ActiveModelSerializers::Deserialization.jsonapi_parse(params)

    if params[:data]["relationships"]["country"]["data"]
      country_id = params[:data]["relationships"]["country"]["data"]["id"]
      hash[:country_id] = country_id
    end

    hash.slice!(:id,:name, :surname, :phone, :email, :web, :city, :address, :country_id)

    hash
  end
end
