class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :first_seen

  def id
    object.id.to_s
  end
end
