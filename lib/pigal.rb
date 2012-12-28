require 'rubygems'
require 'sinatra/base'
require 'json'
require './lib/json_proxy_dispatcher'
require 'cgi'
require 'yaml'
require 'nokogiri'
require 'open-uri'

class Pigal < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/get_proxied_json' do
    content_type :json

    jpd = JsonProxyDispatcher.new(get_urls)
    jpd.as_json
  end

  get '/pigal.js' do
    content_type 'application/javascript'

    @encoded_source_urls = get_json_proxy_urls
    erb 'pigal.js'.to_sym
  end

  private

  def config
    @config || YAML.load_file('./config.yml')
  end

  def get_urls
    [params[:urls]].flatten.compact
  end

  def get_json_proxy_urls
    output = ''
    config['urls'].each do |url|
      output += "urls[]=#{CGI.escape(url)}&"
    end
    output
  end
end
