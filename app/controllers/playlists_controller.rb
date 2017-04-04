class PlaylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = current_user.playlists.all
  end

  def show
  end

  def new
    @playlist = current_user.playlists.build
  end

  def edit
  end

  def create
    @playlist = current_user.playlists.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
    end
  end

  private
    def set_playlist
      @playlist = current_user.playlists.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:name, tracks_attributes: [:id, :name, :_destroy])
    end
end
