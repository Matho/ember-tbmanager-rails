class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :file_name
      t.string :file_name_orig_path
      t.string :file_name_small_path
      t.string :dimmensions

      t.timestamps
    end
  end
end
