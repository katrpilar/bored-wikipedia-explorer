require_relative "../lib/scraper.rb"

class Portal
  #belongs_to topic
  #has_many Facts
  attr_accessor :random_portal, :all_portals, :topic
  @@all = []
  def initialize(random_portal)
    @random_portal = random_portal
    @@all << self
    #receives the portal urls array from topic class
  end
  
  def self.random_fact
    return Scraper.scrape_portal_dyk(@random_portal).sample
  end
  
  def self.all
    @@all
  end
  
  def topic_name
    self.topic.name
  end
  binding.pry
end