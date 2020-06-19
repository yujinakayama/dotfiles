Pry.config.prompt = Pry::config.prompt.map do |default_proc|
  proc do |target_self, nest_level, pry|
    # Use RSpec::Core::ExampleGroup instead of auto-generated long example group class name
    if defined?(RSpec::Core::ExampleGroup) && target_self.is_a?(RSpec::Core::ExampleGroup)
      target_self = RSpec::Core::ExampleGroup
    end

    default_proc.call(target_self, nest_level, pry)
  end
end
