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
    jpd = JsonProxyDispatcher.new(config['urls'])
    jpd.as_json
  end

  get '/pigal.js' do
    content_type 'application/javascript'
    erb 'pigal.js'.to_sym
  end

  private

  def config
    @config || YAML.load_file('./config.yml')
  end

end
