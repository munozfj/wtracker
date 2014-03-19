class Photo < ActiveRecord::Base
  belongs_to :user

  #Name scopes
  scope :ordered, lambda { order("photos.date desc") }

  #added for paperclip-drop gem  
  has_attached_file :picture,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
                    :styles => {  medium: "300x300#", 
                                  small:  "100x100#",
                                  thumb:  "50x50#" },    
                    :dropbox_options => {      
                          :path => proc { |style| "#{style}/#{id}_#{picture.original_filename}"},       
                          :unique_filename => true   
                       }

  #Validacion de la imagen
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
