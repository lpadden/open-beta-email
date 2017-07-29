require "sinatra"
require "pony"

get "/" do
  erb :index
end

post "/email" do
  Pony.mail({
    :to => "#{params[:email]}",
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => 'email',
      :password             => 'password',
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
    },
    :subject => "Open beta",
    :body => "Thanks for signing up for our open beta"
  })
  redirect "/"
end
