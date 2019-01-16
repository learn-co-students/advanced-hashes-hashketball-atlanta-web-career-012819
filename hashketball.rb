def game_hash
	game = {
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["Black", "White"],
			:players => {
				"Alan Anderson" => {
					:number => 0,
					:shoe => 16,
					:points => 22,
					:rebounds => 12,
					:assists => 12,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 1
				},
				"Reggie Evans" => {
					:number => 30,
					:shoe => 14,
					:points => 12,
					:rebounds => 12,
					:assists => 12,
					:steals => 12,
					:blocks => 12,
					:slam_dunks => 7
				},
				"Brook Lopez" => {
					:number => 11,
					:shoe => 17,
					:points => 17,
					:rebounds => 19,
					:assists => 10,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 15
				},
				"Mason Plumlee" => {
					:number => 1,
					:shoe => 19,
					:points => 26,
					:rebounds => 12,
					:assists => 6,
					:steals => 3,
					:blocks => 8,
					:slam_dunks => 5
				},
				"Jason Terry" => {
					:number => 31,
					:shoe => 15,
					:points => 19,
					:rebounds => 2,
					:assists => 2,
					:steals => 4,
					:blocks => 11,
					:slam_dunks => 1
				}
			}
		},
		:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players => {
				"Jeff Adrien" => {
					:number => 4,
					:shoe => 18,
					:points => 10,
					:rebounds => 1,
					:assists => 1,
					:steals => 2,
					:blocks => 7,
					:slam_dunks => 2
				},
				"Bismak Biyombo" => {
					:number => 0,
					:shoe => 16,
					:points => 12,
					:rebounds => 4,
					:assists => 7,
					:steals => 7,
					:blocks => 15,
					:slam_dunks => 10
				},
				"DeSagna Diop" => {
					:number => 2,
					:shoe => 14,
					:points => 24,
					:rebounds => 12,
					:assists => 12,
					:steals => 4,
					:blocks => 5,
					:slam_dunks => 5
				},
				"Ben Gordon" => {
					:number => 8,
					:shoe => 15,
					:points => 33,
					:rebounds => 3,
					:assists => 2,
					:steals => 1,
					:blocks => 1,
					:slam_dunks => 0
				},
				"Brendan Haywood" => {
					:number => 33,
					:shoe => 15,
					:points => 6,
					:rebounds => 12,
					:assists => 12,
					:steals => 22,
					:blocks => 5,
					:slam_dunks => 12
				}
			}
		}
	}
end

def num_points_scored(player)
	num_points = nil
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if data.include?(player)
				num_points = data[player][:points]
			end
		end
	end
	num_points
end

def shoe_size(player)
	size = nil
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if data.include?(player)
				size = data[player][:shoe].to_i
			end
		end
	end
	size
end

def team_colors(team)
	colors = nil
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if data.include?(team)
				colors = team_data[:colors]
			end
		end
	end
	colors
end


def team_names
	names = []
	game_hash.each do |location, team_data|
		names << team_data[:team_name]
	end
	names
end

def player_numbers(team)
	numbers = []
	game_hash.each do |location, team_data|
		if team_data[:team_name] == team
			team_data[:players].each do |player, data|
				numbers << data[:number].to_i
			end
		end
	end
	numbers
end

def player_stats(player)
	stats = {}
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if data.include?(player)
				stats = data[player]
			end
		end
	end
	stats
end

def largest_shoe_size
	min_player, min_size = nil
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, data|
			if (!min_size) || data[:shoe] > min_size
				min_player = player
				min_size = data[:shoe]
			end
		end
	end
	min_player
end

def big_shoe_rebounds
	rebounds = nil
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if data.include?(largest_shoe_size)
				rebounds = data[largest_shoe_size][:rebounds]
			end
		end
	end
	rebounds
end