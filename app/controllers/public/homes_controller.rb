class Public::HomesController < ApplicationController
  def top
    @thumbnail = "http://capture.heartrails.com/large?"
    @bookmark_ranks = Site.find(Bookmark.group(:site_id).order('count(site_id) desc').limit(3).pluck(:site_id))
  end
end
