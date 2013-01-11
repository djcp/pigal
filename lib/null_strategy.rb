class NullStrategy
  def self.can_handle?(url)
    false
  end

  def initialize(url)
  end

  def items
    []
  end
end
