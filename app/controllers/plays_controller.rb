class PlaysController < ApplicationController

  def index
    @plays = Play.all
    @blobs = ActiveStorage::Blob.all
  end

  def create
    service = CreatePlay.new(play_params)
    respond_to do |format|
      if @record = service.create_record
        format.html { redirect_to @record }
        format.js { flash.now[:notice] = 'Play was successfully created.' }
        format.json { render json: @record, status: :created, location: @record }
      else
        format.html { redirect_to plays_path }
      end
    end
  end

  private def play_params
    params.require(:play).permit(:blob, :timer).to_h
  end
end
