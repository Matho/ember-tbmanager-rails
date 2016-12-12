require 'shellwords'

class ImagesController < ApplicationController

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


end
