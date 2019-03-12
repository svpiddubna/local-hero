require 'active_support/concern'

module Localheroable
  extend ActiveSupport::Concern

  included do
    before_action :localheroes, only: [:index, :show]
  end

  protected

  def localheroes
    # Methods for retrieving top and most recent localheroes
    @top_localheroes = User.order('votes DESC').limit(3)
    @recent_localheroes = User.order('created_at DESC').limit(3)
  end
end
