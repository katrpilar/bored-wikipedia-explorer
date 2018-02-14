require_relative "../lib/scraper.rb"

class Portal
  #belongs_to topic
  #has_many DidYouKnow
  attr_accessor :random_portal, :all_portals
  @@all = []
  def initialize(random_portal)
    @random_portal = random_portal
    @@all << self
    #receives the portal urls array from topic class
  end
  
  def self.random_fact
    return Scraper.scrape_portal_dyk(@random_portal).sample
  end
  
  def self.all_portals
    @@all
  end
  
end