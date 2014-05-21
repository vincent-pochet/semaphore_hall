require 'sinatra'
require 'json'
require 'net/http'
require 'uri'
require 'yaml'
require './app/settings'
require './app/response'
require './app/message'
require './app/routes'

run Sinatra::Application
