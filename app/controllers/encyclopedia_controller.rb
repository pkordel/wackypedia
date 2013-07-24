class EncyclopediaController < ApplicationController
  def index
    @entries = encyclopedia.entries
  end
end
