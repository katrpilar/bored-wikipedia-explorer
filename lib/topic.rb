require_relative "../lib/scraper.rb"
require_relative "../lib/portal.rb"

class Topic
  #has many Portals
  @@all = []
  attr_accessor :name, :portals
  def initialize(name)
    @name = name
    @portals = []
    # add_portal
    @@all << self
  end

  def find_random_portal_page
    find_rand_portal = Scraper.scrape_portals_page(@name).sample
    # create_portal = Portal.find_rand_portal
    # return create_portal
  end

  # def self.all_topics_list
  #   return Scraper.all_topics
  # end

  # def add_portal
  #   new_portal = self.find_random_portal_page
  #   @portals << new_portal
  #   new_portal.topic = self
  # end

  def portals
    @portals
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if self.all.detect{|topic| topic.name == name}
      @topic = self.all.detect{|topic| topic.name == name}
      # @portal = Portal.find_or_create_by_url(Scraper.scrape_portals_page(name))
      # @portal.topic = @topic
      # @fact = Fact.find_or_create_by_url(Scraper.scrape_portal_dyk(@portal.url))
    else
      @topic = self.new(name)
      # @topic.portals = Scraper.scrape_portals_page(name)
    end
    @topic
  end

end
