require_relative('sql_runner')
require_relative('team')

class Match

  def initialize(options, runner)
    @id = options["id"].to_i
    @home_team_id = options["home_team_id"]
    @away_team_id = options["away_team_id"]
    @home_team_score = options["home_team_score"]
    @away_team_score = options["away_team_score"]
    @runner = runner
  end


end