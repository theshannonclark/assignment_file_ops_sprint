require_relative 'Dictionary'

class DictionaryLoader
  def load(path)
    return nil unless valid_path?(path)
    return Dictionary.new
  end

  def valid_path?(path)
    (path =~ /^\.?\/?\w+?\/?[\.\/\w]+?$/i) and (File.exists?(path))
  end
end