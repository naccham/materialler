class Public::HomesController < ApplicationController

  def top
    @thumbnail = "http://capture.heartrails.com/huge?"
    @bookmark_ranks = Site.find(Bookmark.group(:site_id).order('count(site_id) desc').limit(3).pluck(:site_id))

    @tag1 = Tag.find(1)
    @tag2 = Tag.find(2)
    @tag3 = Tag.find(3)
    @tag7 = Tag.find(7)
    @tag8 = Tag.find(8)
    @tag9 = Tag.find(9)
  end

end
