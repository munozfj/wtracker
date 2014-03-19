class Profile < ActiveRecord::Base

  belongs_to :user;

  #added for paperclip-drop gem  
  has_attached_file :avatar,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
                    :styles => {  medium: "300x300#", 
                                  small:  "100x100#",
                                  thumb:  "50x50#" },    
                    :dropbox_options => {      
                          :path => proc { |style| "#{style}/#{id}_#{avatar.original_filename}"},       
                          :unique_filename => true   
                       }
 
=begin 
  has_attached_file :avatar, 
                    #Opciones de almacenamiento
                    :styles => {  large:  "600#",      
                                  retina: "1200#",
                                  medium: "300x300#", 
                                  small:  "100x100#",
                                  thumb:  "50x50#" }, 
                    #Imagen por default
                    default_url: ActionController::Base.helpers.asset_path('user_male.png'),
                    #:default_url => "/images/user_male.png",
                    #Tamaño de la imagen
                    #:size => { :in => 0..10.megabytes },
                    #tratamiento de la imagen
                    :convert_options => {
                          :thumb    => '-set colorspace sRGB -strip',
                          :small    => '-set colorspace sRGB -strip',
                          :medium   => '-set colorspace sRGB -strip',
                          :large    => '-set colorspace sRGB -strip',
                          :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
                      }
=end

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
end
