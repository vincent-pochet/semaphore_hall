require 'sinatra'
require 'json'
require 'net/http'
require 'uri'
require 'yaml'
require './app/hall_message'
require './app/semaphore_message'
require './app/routes'

run Sinatra::Application
