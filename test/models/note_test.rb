require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test 'should be valid' do
    note = build(:note)
    assert note.valid?
  end

  test 'should not permit empty body' do
    note = build(:note_body_blank)
    assert_not note.valid?
  end
end
