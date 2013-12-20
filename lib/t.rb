dir = File.join(File.dirname(__FILE__))

GEMNAME='tinternet'

$LOAD_PATH << File.join(dir, GEMNAME)

Dir.glob(File.join(dir, GEMNAME, "**", "*.rb")).each {|f| require f}
