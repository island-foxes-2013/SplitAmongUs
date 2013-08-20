class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :size => 200,
             :default => 'http://i00.i.aliimg.com/photo/v0/217768578/Cartoon_pig_book_end.jpg'

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true    

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :bills
  has_many :groups
  has_many :lists, through: :groups

  has_many :paid_settlements, class_name: "Settlement", foreign_key: "payer_id"
  has_many :received_settlements, class_name: "Settlement", foreign_key: "payee_id"


  def amount_owed(list)
    total = 0
    # DO ALL CALCULATIONS IN CENTS:
    #   - iterate over all bills and add to total
    #   - iterate over all paid settlements (for this ist) and add to total
    #   - iterate over all received settlements (for this list) and subtract from total
    Money.new(total)
  end
end

