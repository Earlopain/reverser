class ArtistsController < ApplicationController
  respond_to :html

  def new
    @artist = Artist.new(artist_params)
    respond_with(@artist)
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.valid?
    @artist.url_string.lines.map(&:strip).reject(&:blank?).each do |url|
      result = Sites::Definitions.from_url url

      if !result
        @artist.errors.add(:url, " #{url} is not a supported url") unless result
        next
      elsif !result[:identifier_valid]
        @artist.errors.add(:identifier, "#{result[:identifier]} is not valid for #{result[:site].display_name}")
        next
      end

      artist_url = @artist.artist_urls.new(
        site_type: result[:site].enum_value,
        identifier_on_site: result[:identifier],
        created_at_on_site: Time.now,
        about_on_site: ""
      )
      artist_url.validate
      artist_url.errors.full_messages.each do |msg|
        @artist.errors.add(:url, "#{url} is not valid: #{msg}")
      end
    end

    if @artist.errors.none?
      @artist.artist_urls.each(&:save!)
      @artist.save
    end
    respond_with(@artist)
  end

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    respond_with(@artist)
  end

  private

  def artist_params
    permitted_params = %i[name url_string]

    params.fetch(:artist, {}).permit(permitted_params)
  end
end