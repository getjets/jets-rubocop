def formatted_env
  if defined?(Rails)
    case Rails.env
    when "production"
      bold_upcased_env = Pry::Helpers::Text.bold(Rails.env.upcase)
      Pry::Helpers::Text.red(bold_upcased_env)
    when "staging"
      Pry::Helpers::Text.yellow(Rails.env)
    when "development"
      Pry::Helpers::Text.green(Rails.env)
    else
      Rails.env
    end
  else
    Pry::Helpers::Text.green("rubocop")
  end
end

def app_name
  if defined?(Rails)
    File.basename(Rails.root)
  else
    "jets-rubocop"
  end
end

Pry.config.prompt = Pry::Prompt.new(
  "jets-rubocop",
  "Jets Rubocop prompt",
  [proc { |obj, nest_level, _| "[#{app_name}][#{formatted_env}] #{obj}:#{nest_level}> " }]
)
