class Like < ApplicationRecord
  belongs_to :spala
  belongs_to :user
  validates_uniqueness_of :spala_id, scope: :user_id
end
