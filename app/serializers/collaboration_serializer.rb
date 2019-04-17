class CollaborationSerializer < ActiveModel::Serializer
  attributes :id, :collaborator_id, :collaboratee_id, :collab_post_id
  belongs_to :collaborator, class_name: 'User'
  belongs_to :collaboratee, class_name: 'User'
  belongs_to :collab_post
end
