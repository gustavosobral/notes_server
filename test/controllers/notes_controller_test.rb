require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    DatabaseCleaner.clean
    @note = create(:note)
  end

  test 'should get index' do
    get notes_url
    assert_response :success
    assert_equal @note.id.to_s, json_response[0]['id']
  end

  test 'should create note' do
    assert_difference 'Note.count', 1 do
      post notes_url, note: { title: 'My note',
                              body: 'Body content!',
                              status: 'draft',
                              first_seen: '2016-06-20T20:25:43.Z' }
    end
    assert_response :created
  end

  test 'should show note' do
    get note_url(@note)
    assert_response :success
    assert_equal @note.id.to_s, json_response['id']
    assert_equal @note.title, json_response['title']
    assert_equal @note.body, json_response['body']
    assert_equal @note.status, json_response['status']
    assert_equal 1, json_response['views']
    assert_not_nil json_response['first_seen']
  end

  test 'should update note' do
    get note_url(@note)
    assert_equal '<h1>This is a valid body!</h1>', json_response['body']
    put note_url(@note), note: { body: 'Body content updated!' }
    get note_url(@note)
    assert_equal 'Body content updated!', json_response['body']
  end

  test 'should set first_seen' do
    @note = create(:note, first_seen: '')
    get note_url(@note)
    assert_nil json_response['first_seen']
    put note_url(@note), note: { first_seen: 1.month.ago }
    get note_url(@note)
    assert_not_nil json_response['first_seen']
  end

  test 'should note update first_seen' do
    put note_url(@note), note: { first_seen: 1.month.ago }
    assert_equal ["can't be updated"], json_response['first_seen']
    assert_response :unprocessable_entity
  end

  test 'should increase view_counter' do
    get note_url(@note)
    get note_url(@note)
    assert_equal 2, json_response['views']
  end

  test 'should destroy note' do
    get note_url(@note)
    assert_response :success
    delete note_url(@note)
    get note_url(@note)
    assert_equal 'Record not found!', json_response['error']
    assert_response :not_found
  end
end
