require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test 'should be valid' do
    note = build(:note)
    assert note.valid?
  end

  test 'should not permit empty title' do
    note = build(:note, title: '')
    assert_not note.valid?
  end

  test 'should not permit title greater than 80' do
    note = build(:note_title_greater)
    assert_not note.valid?
  end

  test 'should not permit empty body' do
    note = build(:note, body: '')
    assert_not note.valid?
  end

  test 'should not permit empty status' do
    note = build(:note, status: '')
    assert_not note.valid?
  end

  test 'should not permit invalid status' do
    note = build(:note, status: 'unused')
    assert_not note.valid?
  end
end
