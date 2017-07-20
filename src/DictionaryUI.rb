require_relative 'DictionaryLoader'

class DictionaryUI
  def run
    dict_path = prompt_dict_path
    unless quit?(dict_path)
      loader = DictionaryLoader.new
      dictionary = loader.load(dict_path)
      while dictionary.nil?
        puts "Error: File does not exist"
        dict_path = prompt_dict_path
        unless quit?(dict_path)
          dictionary = loader.load(dict_path)
        else
          notify_exit
          return
        end
      end
    else
      notify_exit
      return
    end
  end

  def prompt_dict_path
    path = ""
    while path.empty?
      puts "Where is your dictionary? ('q' to quit)"
      path = gets.strip
    end
    return path
  end

  def quit?(input)
    return input =~ /^q(uit)?$/i
  end

  def notify_exit
    puts "Exiting application"
  end
end