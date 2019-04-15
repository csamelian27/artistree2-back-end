class Collaboration < ApplicationRecord
  belongs_to :collaborator, class_name: 'User'
  belongs_to :collaboratee, class_name: 'User'
end
