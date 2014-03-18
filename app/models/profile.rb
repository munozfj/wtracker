class Profile < ActiveRecord::Base

  belongs_to :user;
  has_attached_file :avatar, 
                    #Opciones de almacenamiento
                    :styles => {  large: "600>",      
                                  retina: "1200>",
                                  medium: "300x300>", 
                                  thumb: "100x100>" }, 
                    #Imagen por default
                    default_url: ActionController::Base.helpers.asset_path('user_male.png'),
                    #:default_url => "/images/user_male.png",
                    #Tamaño de la imagen
                    #:size => { :in => 0..10.megabytes },
                    #tratamiento de la imagen
                    :convert_options => {
                          :thumb    => '-set colorspace sRGB -strip',
                          :medium  => '-set colorspace sRGB -strip',
                          :large    => '-set colorspace sRGB -strip',
                          :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
                      }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
end
