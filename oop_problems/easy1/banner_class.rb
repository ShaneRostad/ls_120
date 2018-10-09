class Banner

  attr_reader :width

  def initialize(message, width=(message.size + 2))
    @message = message
    @width = width

  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{('-' * @message.size).center(width, '-')}-+"
  end

  def empty_line
    "| #{(' ' * @message.size).center(width, ' ')} |"
  end

  def message_line
    "| #{@message.center(width)} |"
  end
end

banner = Banner.new('whats up bud')
puts banner
