# -*- encoding : utf-8 -*-

module Settings
  def self.config(name = 'config')
    (@config ||= {})[name] ||= YAML::load_file(File.join(File.dirname(__FILE__), "../config/#{name}.yml"))[ENV['RACK_ENV']]
  end

  def self.hall_url
    config['hall_url']
  end
end
