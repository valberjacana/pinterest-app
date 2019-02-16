class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    #un usuario tiene muchos pins
    has_many :pins
  
    def avatar
      type = ['men','women'].sample
      number = (1..99).to_a.sample
      #"https://randomuser.me/api/portraits/women/87.jpg"
      "https://randomuser.me/api/portraits/#{type}/#{number}.jpg"
    end
  
  end