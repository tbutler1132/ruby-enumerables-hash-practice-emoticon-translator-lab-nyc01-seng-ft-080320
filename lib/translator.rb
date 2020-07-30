require 'yaml'
require 'pry' # require modules here

def load_library(file_path = 'lib/emoticons.yml')
  emoticon_library = YAML.load_file(file_path)
  result = emoticon_library.each_with_object({}) do |(key, value), final_hash|
    if !final_hash[key]
      final_hash[key] = {
        :english => value[0],
        :japanese => value[1]
      }
    end
    result
  end
end

# if emotion[:english] = e_emomitcon than return emotion[:japanese]

def get_japanese_emoticon(yaml_file, eng_emoticon)
  translation = ""
  new_hash = load_library(yaml_file)
  new_hash.each do |name, languages|
      if languages[:english] == eng_emoticon 
      translation = languages[:japanese]
    end
  end
    if translation == ""
      return "Sorry, that emoticon was not found"
    else
      return translation
    end
end
#
def get_english_meaning(file,j_emoticon)
  emoticons = load_library(file)
  eng_meaning = ""
  apology = "Sorry, that emoticon was not found"
  emoticons.each do |emotion, lang|
    lang.each do |inner_key,emoticon|
      if emoticon == j_emoticon
        eng_meaning = emotion
      end
    end
    if eng_meaning == ""
      eng_meaning = apology
    end
  end
  eng_meaning
end
