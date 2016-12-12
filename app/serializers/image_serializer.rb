class ImageSerializer < ActiveModel::Serializer
  attributes :id, :file_name, :file_name_orig_path, :file_name_small_path, :dimmensions
end
