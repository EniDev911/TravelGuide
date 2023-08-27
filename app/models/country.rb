class Country < ApplicationRecord
    has_many :articles, dependent: :destroy
end
