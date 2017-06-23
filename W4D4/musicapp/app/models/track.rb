class Track < ApplicationRecord
  validates :albumt_id, presence: true
  validates :name, presence: true
  validates :lyrics, presence: true

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band

end
