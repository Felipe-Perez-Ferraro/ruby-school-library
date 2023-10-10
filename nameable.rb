class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} must implement the correct_name method"
  end
end
