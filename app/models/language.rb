class Language < ApplicationRecord
  has_many :skills

  validates :name, presence: true, uniqueness: true
end
