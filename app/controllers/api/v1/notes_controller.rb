class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = params.has_key?(:q) && !params[:q].blank? ? search_by_query(params[:q]) : Note.all

    paginate json: @notes
  end

  # GET /notes/1
  def show
    @note.views += 1
    @note.first_seen ||= Time.now
    @note.save

    render json: @note
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created, location: api_v1_note_url(@note)
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      head :no_content
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy

    head :no_content
  end

  private

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :body, :status)
    end

    def search_by_query(query)
      Note.search(query).records
    end
end
