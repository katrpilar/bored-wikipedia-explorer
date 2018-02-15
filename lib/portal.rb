require_relative "../lib/scraper.rb"

class Portal
  #belongs_to topic
  #has_many Facts
  attr_accessor :random_portal, :all_portals, :topic_name
  @@all = []
  def initialize(random_portal)
    @random_portal = random_portal
    @@all << self
    #receives the portal urls array from topic class
  end
  
  def self.random_fact
    binding.pry
    return Scraper.scrape_portal_dyk(@random_portal).sample
  end
  
  def self.all
    @@all
  end
  
end