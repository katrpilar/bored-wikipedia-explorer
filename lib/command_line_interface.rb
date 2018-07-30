require_relative "../lib/fact.rb"
require_relative "../lib/topic.rb"
require "colorize"

class CommandLineInterface
  def self.run
    puts "Welcome to Did-You-Know Wikipedia Edition!"
    puts "Please select a topic to learn some cool random facts:"

    #Displays all available main topics
    display_all_topics
    puts "Select a number to explore facts from that topic"
    @choice = @list[gets.strip.to_i]

    #determines portal contents page url
    binding.pry
    get_selected_portal_contents_url(@choice_i)

    #finds or creates an Topic instance
    @selectedTopic = Topic.find_or_create_by_name(@choice)
    @randurl = Scraper.scrape_portals_page(@choice)
    @randfact = Scraper.scrape_portal_dyk(@randurl)
    # Scraper.scrape_portal_dyk(@randurl)
    # binding.pry
    #selects a random portal url from Scraper.scrape_portals_page
    @portal = Portal.find_or_create_by_url(@randurl, @selectedTopic)
    @selectedTopic.portals << @portal

    @fact = Fact.find_or_create_by_url(@randurl, @randfact, @portal)
    @portal.facts << @fact
    # binding.pry
    # binding.pry
    @portal.topic = @selectedTopic
  end

  #beautifies and lists the command line options
  def self.display_all_topics
    colors = [:red, :green, :yellow, :blue, :magenta, :cyan, :red, :green, :yellow, :blue, :magenta]
    @list = []
    Topic.all_topics_list.each_with_index{|item, indx|
      @list << item
      puts "#{indx + 1}. #{item}".colorize(colors[indx])
    }
  end
end
