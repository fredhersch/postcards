class Postcard < ActiveRecord::Base

  has_attached_file :photo, 
    :path => "/shared/system/uploads/:attachment/:id/:style/:basename.:extension",
    :styles => { :original => '800x600>', :medium => "300x300>", :thumb => "150x150>", :small => "100x100",
      :feature => '600x250'  }
  acts_as_taggable
  belongs_to :user
  has_many  :votes
  has_many  :links
  has_and_belongs_to_many :categories
  after_update  :save_links

  validates_presence_of :title, :description
  validates_uniqueness_of :title
  validates_acceptance_of :terms_of_service, :allow_nil => true
  #validations for paperclip
  #validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif' ]
  validates_attachment_size :photo, :less_than => 1.megabytes, :message => 'File must be smaller than 1 mb'
  
  #validates_associated  :links
  #validates_format_of :link, :with => /^((http|https):\/\/)*[a-z0-9_-]{1,}\.*[a-z0-9_-]{1,}\.[a-z]{2,4}\/*$/i   
  
  #before_save :build_link_url

  # To handle link model
  # using virtual attributes
  def link_attribute=(link_attribute)  
    link_attribute.each do |attributes|
      if attributes[:id].blank?
        links.build(attributes)
      else 
        link = links.detect {|l| l.id == attributes[:id].to_i }
        link.attributes = attributes
      end
    end
  end
  def to_param
    "#{id}-#{title.gsub(/\W/, '-').downcase}"
  end
  
  def self.search(search, page)
    @approved = '1'
    if search
      paginate :per_page => 10, :page => page,
        :conditions => ['approved = 1 AND title like ?', "%#{search}%"], :order => 'title'
    else
      find(:all, :order => 'id DESC', :conditions => ['approved = ?', @approved], :limit => 5)
    end
  end
  
  def self.per_page
      6
  end
  
  # Fix the mime types. Make sure to require the mime-types gem
  def swfupload_file=(data)
    data.content_type = MIME::Types.type_for(data.original_filename).to_s
    self.file = data
  end
  
  def save_links
    links.each do |l|
      if l.should_destroy?
        l.destroy
      else
        l.save(false)
      end
    end
  end
      
  #def validate
  #  errors.add(:url, "unexistent") unless Postcard.existent_url?(:url)
  #end

  #def self.existent_url?(url)
  #  uri = URI.parse(url)
  #  http_conn = Net::HTTP.new(uri.host, uri.port)
  #  resp, data = http_conn.head("/" , nil)
  #  resp.code == "200"
  #end
  
end
