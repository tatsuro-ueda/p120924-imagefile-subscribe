require 'sinatra'
require 'haml'

get '/' do
    haml :index
end

# アップロードされたファイルを返す
put '/upload' do
  if params[:file]
    content_type params[:file][:type]
    f = params[:file][:tempfile]
    f.read f.size
  end
end

get '/index.html'
end

__END__
@@index
%html
  %body
    %form{:action => '/upload', :method => 'POST', :enctype => 'multipart/form-data'}
      %input{:type => 'file',   :name => 'file'}
      %input{:type => 'submit', :value => 'upload'}
      %input{:type => 'hidden', :name => '_method', :value => 'put'}