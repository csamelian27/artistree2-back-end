class CollaborationSerializer < ActiveModel::Serializer
  attributes :id, :collaborator_id, :collaboratee_id
end
