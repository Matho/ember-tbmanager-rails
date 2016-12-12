json.extract! image, :id, :file_name, :file_name_orig_path, :file_name_small_path, :dimmensions, :created_at, :updated_at
json.url image_url(image, format: :json)