class Like < ApplicationRecord
    # to enforce a chef_id can only be associated with a like and a recipe once.
    validates_uniqueness_of :chef, scope: :recipe
    belongs_to :chef
    belongs_to :recipe
end