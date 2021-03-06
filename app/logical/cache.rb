# frozen_string_literal: true

module Cache
  module_function

  def fetch(key, expires_in = nil, &)
    Rails.cache.fetch(key, expires_in: expires_in, &)
  end

  def write(key, value, expires_in = nil)
    Rails.cache.write(key, value, expires_in: expires_in)
  end

  def delete(key)
    Rails.cache.delete(key)
  end

  def clear
    Rails.cache.clear
  end
end
