class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :status, :view_counter, :first_seen

  def id
    object.id.to_s
  end
end
