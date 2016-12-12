class Image < ApplicationRecord
  validates_presence_of :file_name, :file_name_orig_path, :file_name_small_path, :dimmensions
end
