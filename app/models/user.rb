class User < ActiveRecord::Base

  before_save {self.email = email.downcase }

  has_secure_password

  #Validaciones Name
  validates :name, presence: true,
                   length: { maximum: 100 }

  #Validaciones Email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: {casesensitive: false}

  #Validaciones Password_digest
  validates :password, presence: true,
                                 length: {minimum: 6},
                                 confirmation: true;

  #Validaciones Password_disgest_confirmation
  validates :password_confirmation, presence: true;


end
