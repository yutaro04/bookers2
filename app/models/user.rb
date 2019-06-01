class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :books, dependent: :destroy

  validates :introduction, length: { maximum: 20 }

  validates :name, presence: true, uniqueness: true, length: {maximum: 20, minimum: 2 }

  def email_required?
    false
  end

  def email_changed?
    false
  end
end

