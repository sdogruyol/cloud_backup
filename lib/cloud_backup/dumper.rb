require 'dropbox_sdk'
require 'yaml'

class Dumper

  def initialize
    settings = YAML.load_file('../settings.yml')
    @app_key = settings['dropbox']['app_key']
    @app_secret = settings['dropbox']['app_secret']
    @db_name = settings['database']['db_name']
    @db_password = settings['database']['db_password']
    @db_user = settings['database']['db_user']

    if File::exists?(".dump_db")
        data = File.read(".dump_db")
        @access_token =  Marshal.load(data)
    end

    if @access_token
        puts 'Your access token is ' + @access_token
    else
        authorize
    end
  end

  def authorize
    flow = DropboxOAuth2FlowNoRedirect.new(@app_key, @app_secret)
    authorize_url = flow.start()

    # Have the user sign in and authorize this app
    puts '1. Go to this link in your web browser: ' + authorize_url
    puts '2. Click "Allow" (you might have to log in first)'
    puts '3. Copy the authorization code'
    print 'Enter the authorization code here: '
    code = gets.strip

    # This will fail if the user gave us an invalid authorization code
    @access_token, user_id = flow.finish(code)
    data = Marshal.dump(@access_token)
    open('.dump_db', 'wb') { |f| f.puts data }
  end

  def upload_file(file_name)
    client = DropboxClient.new(@access_token)
    file = open(file_name)
    puts 'Uploading file!! Please wait.'
    response = client.put_file("/#{file_name}", file)
    puts "uploaded:", response.inspect
  end

  def dump_db
    date = Time.now.strftime('%d%m%y')
    file_name = "#{@db_name}_#{date}.sql"
    puts "Backing up the db to #{file_name}"
    `mysqldump -u #{@db_user} -p#{@db_password} #{@db_name} > #{file_name}`
    upload_file file_name
  end

end


