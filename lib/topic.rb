require_relative "../lib/scraper.rb"
require_relative "../lib/portal.rb"

class Topic
  #has many Portals
  @@all = []
  attr_accessor :name, :portals, :all
  def initialize(name)
    find_or_create_by_name(name)
    @portals = []
    add_portal
    @@all << self
  end
  
  # def self.create_from_collection(students_array)
  #   students_array.each{|student|
  #     newstudent = self.new(student)
  #   }
    
  # end
  
  def find_random_portal_page
    find_rand_portal = Scraper.scrape_portals_page(@name).sample
    create_portal = Portal.new(find_rand_portal)
    return create_portal
  end
  
  def self.all_topics_list
    return Scraper.all_topics
  end
  
  # def self.portals
  #   Portal.new()
  # end
  
  def add_portal
    new_portal = self.find_random_portal_page
    @portals << new_portal
    new_portal.topic = self
    binding.pry
  end
  
  def portals
    @portals
  end
  
  def self.all
    @@all
  end
  
  def self.find_or_create_by_name(name)
    @name = name
    if @@all.detect{|item| item.name == @name}
      @@all.detect{|item| item.name == @name}
    else
      
    end
  end
end