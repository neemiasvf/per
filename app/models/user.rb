class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :picture, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/default_profile_pic.png'
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  validates :full_name, :email, :encrypted_password, presence: true
end
