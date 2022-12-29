class User < ApplicationRecord
  has_many :study_records, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :email
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ゲストログイン用
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト管理者"
      user.admin = true
    end
  end
end
