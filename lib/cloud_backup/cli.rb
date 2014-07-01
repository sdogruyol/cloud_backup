require_relative 'dumper'

class Cli
  def initialize
    @dumper = Dumper.new
    puts 'What type of dump do you want?'
    puts '1. Auto Dump (Auto Dumps the Db and Stores it to Dropbox)'
    puts '2. Select dump file by yourself'
    dump_type = gets.strip
    case dump_type
    when '1'
        @dumper.dump_db()
    when '2'
        puts 'Please enter the dump file name.'
        file_name = gets.strip
        @dumper.upload_file file_name
    end
  end
end