require 'active_support/concern'

module Mappable
  extend ActiveSupport::Concern

  included do
    before_action :map_markers, only: [:index, :new, :show, :user_index]
  end

  protected

  def map_markers
    if current_user.latitude && current_user.longitude
      @markers = [{ lng: current_user.longitude, lat: current_user.latitude,
                    image_url: helpers.asset_url('locationmarker.png') }]
    else
      @markers = []
    end
    allevents = Event.near([current_user.latitude, current_user.longitude], 1)
      @eventmarkers = allevents.map do |event|
        {
          lng: event.longitude,
          lat: event.latitude,
          infoWindow:  render_to_string(partial: 'shared/infowindow', locals: { event: event }),
          image_url: helpers.asset_url('mapmarker.png')
        }
      end
  end
end
