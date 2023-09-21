class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :spalas, dependent: :destroy
         validates :name, presence: true 
         validates :profile, length: { maximum: 200 } 
         has_many :likes, dependent: :destroy
         has_many :liked_spalas, through: :likes, source: :spala
         mount_uploader :image, ImageUploader
         def already_liked?(spala)
          self.likes.exists?(spala_id: spala.id)
        end
end
