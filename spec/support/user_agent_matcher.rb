class RSpec::Core::ExampleGroup

  class << self
    def detect(user_agent, &block)
      klass = self.describes
      subject = klass.new(user_agent)

      yield subject if user_agent
    end
  end

end