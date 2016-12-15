require 'shellwords'

class ImagesController < UnautentificatedController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def upload
    uploaded_io = params[:file]
    file_name = uploaded_io.original_filename
    File.open(Rails.root.join('public', 'uploads', file_name), 'wb') do |file|
      file.write(uploaded_io.read)
    end


    # generate thumbnails
    escaped_file_name = Shellwords.escape(file_name)
    escaped_file_name_in_path =       Rails.root.join('public', 'uploads',  escaped_file_name)
    escaped_small_file_name_in_path = Rails.root.join('public', 'uploads', 'small', escaped_file_name)

    command = "convert -resize 140x140 #{escaped_file_name_in_path} #{escaped_small_file_name_in_path}"
    system(command)

    # lets pretend it is allways OK
    respond_to do |format|
      format.html { render :upload }
      format.json { render json: {} }
    end
  end

  # GET /images
  # GET /images.json
  def index
    @images = Image.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @image }
    end
  end


  # GET /images/new
  def new
    @image = Image.new

    respond_to do |format|
      format.html { render :new }
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @image }
    end
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render json: @image}
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render json: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      hash = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      hash.slice!(:file_name, :file_name_orig_path, :file_name_small_path, :dimmensions)
      hash
    end
end
