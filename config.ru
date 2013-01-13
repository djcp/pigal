require './lib/pigal'

logger = IO.popen("logger -t 'pigal' -p local1.info","w")

$stdout.reopen(logger)
$stderr.reopen(logger)

run Pigal.new
