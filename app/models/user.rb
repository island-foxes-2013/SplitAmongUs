class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :size => 200,
             :default => 'http://i00.i.aliimg.com/photo/v0/217768578/Cartoon_pig_book_end.jpg'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :groups
  has_many :lists, through: :groups
end
