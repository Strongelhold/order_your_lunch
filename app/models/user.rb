class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :orders

  validates :name, presence: true

  after_create :make_admin

  private

  def make_admin
    update_attributes(admin: true) if User.count == 1
  end
end
