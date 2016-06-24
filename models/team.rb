require_relative('sql_runner')

class Team

def initialize(options, runner)
  @id = options["id"].to_I
  @name = options["name"]
  @runner = runner
end


end