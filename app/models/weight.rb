class Weight < ActiveRecord::Base

belongs_to :user;

#Name scopes
scope :sorted, lambda { order("weights.date desc") }

#Validaciones de Fecha
validates :date, presence: true

#Validaciones de peso
validates :weight, presence: true, numericality: true

#VAlidaciones del porcentaje de grasa
validates :fat_porcentage, numericality: true
end
