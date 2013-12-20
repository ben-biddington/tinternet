dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "t", "**", "*.rb")).each {|f| require f}
