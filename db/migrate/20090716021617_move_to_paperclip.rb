class MoveToPaperclip < ActiveRecord::Migration
  def self.up
    rename_column :profiles, :icon, :icon_file_name
    add_column :profiles, :icon_content_type, :string
    add_column :profiles, :icon_file_size, :integer
    rename_column :photos, :image, :image_file_name
    add_column :photos, :image_content_type, :string
    add_column :photos, :image_file_size, :integer
  end
  
  def self.down
    rename_column :profiles, :icon_file_name, :icon
    remove_column :profiles, :icon_content_type
    remove_column :profiles, :icon_file_size 
    rename_column :photos, :image_file_name, :image
    remove_column :photos, :image_content_type
    remove_column :photos, :image_file_size 
  end
end
