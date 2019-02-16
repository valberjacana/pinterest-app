class Pin < ApplicationRecord
    #un Pin pertenece a un usuario
    belongs_to :user
    has_many :likes
    #has_one: like  ==> si tuviera solo un solo like
end