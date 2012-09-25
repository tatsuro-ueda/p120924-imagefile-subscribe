require 'sinatra'

get '/' do
  'Hello World !'
end

# アップロードされたファイルを返す
put '/upload' do
  if params[:file]
    content_type params[:file][:type]
    f = params[:file][:tempfile]
    f.read f.size
  end
end