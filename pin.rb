class Pin
  attr_reader :color

  def initialize(color = random_color)
    @color = color
  end

  private

  def random_color
    colors.sample
  end

  def colors
    %w[red blue green yellow purple orange]
  end
end
