class Blogger < ApplicationRecord

    validates :name, uniqueness: true 
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30} 

    has_many :posts 
    has_many :destinations, through: :posts




end
