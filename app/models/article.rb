class Article < ApplicationRecord
  belongs_to :country
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :users, through: :reactions #or comments doesn't matt
  Kinds = %w[like dislike not_interest neutral].freeze
  KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta", "not_interest" => "No me interesa", "neutral" => "Neutral"}.freeze
end
