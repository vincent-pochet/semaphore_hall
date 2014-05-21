# -*- encoding : utf-8 -*-
class SemaphoreMessage

  def initialize(data)
    @data = data
  end

  def to_json
    {
      title: "Semaphore",
      message: message,
      picture: 'https://semaphoreapp.com/docs/assets/img/design/logo-docs.png'
    }.to_json
  end

  def message
    ERB.new("<%= status_icon %> [<%= branch_name %>] <%= build_result %>: <%= commit_message %> - <%= author_name %> (<a href=\"<%= build_url %>\"><%= build_url %></a>)").result(binding)
  end

  def status_icon
    @data['result'] == 'passed' ? ':sparkle:' : ':bangbang:'
  end

  def branch_name
    "#{@data['project_name']}/#{@data['branch_name']}"
  end

  def build_result
    @data['result'].capitalize
  end

  def commit_message
    @data['commit']['message']
  end

  def author_name
    @data['commit']['author_name']
  end

  def build_url
    @data['build_url']
  end

end
