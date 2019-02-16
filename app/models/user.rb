class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pins
  def avatar
  	type=['men','women'].sample #genera al azar entre men y women
  	number=(1..99).to_a.sample #numero al azar entre 1 y 99

  	"https://randomuser.me/api/portraits/#{type}/#{number}.jpg"
  end

end
