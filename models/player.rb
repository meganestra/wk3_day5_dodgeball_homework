require_relative('sql_runner')
require_relative('team')
require('pg')

class Player

  attr_reader(:id, :first_name, :last_name, :team_id)

  def initialize(options, runner)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @team_id = options["team_id"].to_i
    @runner = runner
  end

  def save()
    sql = "INSERT INTO players (first_name, last_name, team_id)
    VALUES ('#{@first_name}', '#{@last_name}', #{@team_id}) RETURNING *"
    return Player.map_item(sql, @runner)
  end

  def self.all(runner)
    sql = "SELECT * FROM players"
    result = Player.map_items(sql, runner)
    return result
  end

  def self.delete(runner)
    sql = "DELETE FROM players"
    runner.run(sql)
  end

  def self.map_items(sql, runner)
    players_data = runner.run(sql)
    result = players_data.map { |player| Player.new(player, runner) }
    return result
  end

  def self.map_item(sql, runner)
    result = Player.map_items(sql, runner)
    return result.first
  end




end