require 'rubygems'
require 'sinatra/base'
require 'feed-abstract'
require 'json'
require './lib/json_proxy_dispatcher'
require 'cgi'

class Pigal < Sinatra::Base

  get '/' do
    @encoded_source_urls = get_json_proxy_urls
    erb :index
  end

  get '/get_proxied_json' do
    content_type :json

    jpd = JsonProxyDispatcher.new(get_urls)
    jpd.as_json
  end

  private

  def get_urls
    [params[:urls]].flatten.compact
  end

  def get_json_proxy_urls
    output = ''
    File.read('./image_source_urls.txt').split(/\n/).each do |url|
      if url.match(/^\s?#/)
        next
      end
      output += "urls[]=#{CGI.escape(url)}&"
    end
    output
  end
end
