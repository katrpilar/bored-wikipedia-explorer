require_relative "../lib/scraper.rb"

class Portal
  #belongs_to topic
  #has_many Facts
  #selects a random portal url
  attr_accessor :name, :all_portals, :topic
  @@all = []
  def initialize(portal_url) #is given a random portal url
    @portal_url = portal_url
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
  
  def self.find_or_create_by_url(url)
    @url = url
    if @@all.detect{|item| @url.name}
  end
end