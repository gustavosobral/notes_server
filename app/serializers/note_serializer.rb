class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :status, :first_seen

  def id
    object.id.to_s
  end
end
