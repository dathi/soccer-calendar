# Soccer Calendar

This is side project to get soccer calendar's information from livescore.com

## Information

### Ruby version
2.2.2

### Rails
4.2.3

### Testing
Rspec and Cucumber to apply TDD/BDD

### Hosting
Heroku

## How it works
- Use crawl technique to fetch and parse data from livescore.com, then store in data into database.
- Use Grape as a web API to expose data

There are 4 tables:
- Tournaments: id, name, tournament_type_id
- Matches: id, tournament_id, happen_datetime, score
- Teams: id, name, match_id, points
- TournamentTypes: id, name
