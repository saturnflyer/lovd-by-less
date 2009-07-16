# == Schema Information
# Schema version: 2008100601002
#
# Table name: photos
#
#  id         :integer(4)    not null, primary key
#  caption    :string(1000)  
#  created_at :datetime      
#  updated_at :datetime      
#  profile_id :integer(4)    
#  image      :string(255)   
#


class Photo < ActiveRecord::Base
  
  has_many :comments, :as => :commentable, :dependent => :destroy, :order => 'created_at ASC'
  
  belongs_to :profile
  
  validates_presence_of :image, :profile_id
  attr_immutable :id, :profile_id
  
  def after_create
    feed_item = FeedItem.create(:item => self)
    ([profile] + profile.friends + profile.followers).each{ |p| p.feed_items << feed_item }
  end

  has_attached_file :image, 
    :styles => { :small => ["175x250>", :jpg], :square => ["50x50", :jpg], :original => ["1024x768", :jpg]  }, 
    :convert_options => { :small => "-strip -quality 60", :square => "-strip -quality 60", :original => "-strip -quality 75" }
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png', 'image/jpg']
  validates_attachment_size :image, :in => 0.kilobytes..4096.kilobytes
  
  # file_column :image, :magick => {
  #   :versions => { 
  #     :square => {:crop => "1:1", :size => "50x50", :name => "square"},
  #     :small => "175x250>"
  #   }
  # }
    
end
