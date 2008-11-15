class Postcard < ActiveRecord::Base

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  acts_as_taggable
  validates_presence_of :title
  validates_uniqueness_of :title
  belongs_to :user
  has_many  :comments
  has_many  :votes
  
  def to_param
    "#{id}-#{title.gsub(/\W/, '-').downcase}"
  end
  
  def self.search(search, page)
    paginate :per_page => 10, :page => page,
      :conditions => ['title like ?', "%#{search}%"], :order => 'title'
  end
  
  def self.per_page
      6
  end
  
  # Fix the mime types. Make sure to require the mime-types gem
  def swfupload_file=(data)
    data.content_type = MIME::Types.type_for(data.original_filename).to_s
    self.file = data
  end
  
end
