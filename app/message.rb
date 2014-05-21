# -*- encoding : utf-8 -*-
class Message

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
    ERB.new(
    <<-END_TEMPLATE
<%= status_icon %> [<%= @data['project_name'] %>/<%= @data['branch_name'] %>] <%= @data['result'].capitalize %>: <%= @data['commit']['message'] %> - <%= @data['commit']['author_name'] %> (<a href=\"<%= @data['build_url'] %>\"><%= @data['build_url'] %></a>)
    END_TEMPLATE
    ).result(binding)
  end

  def status_icon
    @data['result'] == 'passed' ? ':sparkle:' : ':bangbang:'
  end

end
