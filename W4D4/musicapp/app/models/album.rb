class Album < ApplicationRecord
  validates :band_id, presence: true
  validates :name, presence: true
  validates :year, presence: true

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band

  has_many :tracks, dependent: :destroy
end
