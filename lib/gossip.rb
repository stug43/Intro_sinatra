class Gossip
	attr_accessor :gossip_author, :gossip_content

	def initialize(name, content)
		@gossip_author = name
		@gossip_content = content
	end

	def save
		CSV.open('./db/gossip.csv', 'ab') do |csv|
			csv << [@gossip_author, @gossip_content]
		end
	end

	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
			all_gossips << Gossip.new(csv_line[0], csv_line[1])
		end
		return all_gossips
	end
end
