class Playlist < ApplicationRecord
  belongs_to :user

  has_many :playlist_tracks, dependent: :destroy
  has_many :tracks, through: :playlist_tracks

  accepts_nested_attributes_for :tracks, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
end
