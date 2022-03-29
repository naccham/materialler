class Public::HomesController < ApplicationController

  def top
    @thumbnail = "http://capture.heartrails.com/huge?"
    @sites = Site.find(Bookmark.group(:site_id).order('count(site_id) desc').limit(10).pluck(:site_id))
    @tag1 = Tag.find(1)
    @tag2 = Tag.find(2)
    @tag3 = Tag.find(3)
    @tag4 = Tag.find(4)
    @tag5 = Tag.find(5)
    @tag6 = Tag.find(6)
  end

end
