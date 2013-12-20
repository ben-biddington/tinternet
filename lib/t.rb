dir = File.join(File.dirname(__FILE__))

$LOAD_PATH.unshift dir

Dir.glob(File.join(dir, "t", "**", "*.rb")).each {|f| require f}
