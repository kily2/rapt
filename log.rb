
$log_on = ""
$log_on = ARGV[0].chomp if !ARGV.empty?


def log(error)
	if $log_on =~ /log/
		puts error
	end
end


### log.rb


