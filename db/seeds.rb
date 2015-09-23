# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

season = TournamentType.create(:name => "Season")
cup = TournamentType.create(:name => "Cup")

Tournament.create(:name => 'England - Premier League', tournament_type: season)
Tournament.create(:name => 'Italy - SerieA', tournament_type: season)
Tournament.create(:name => 'Spain - Liga BBVA', tournament_type: season)
Tournament.create(:name => 'Champions League', tournament_type: cup)

