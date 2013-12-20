dir = File.join(File.dirname(__FILE__))

$LOAD_PATH << File.join(dir, "t")

Dir.glob(File.join(dir, "t", "**", "*.rb")).each {|f| require f}
