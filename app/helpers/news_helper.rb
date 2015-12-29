module NewsHelper
  def locale_attribute_name(object, attribute, locale)
    if locale == 'pt-BR'
      "#{attribute}_pt".to_sym
    else
      "#{attribute}_es".to_sym
    end
  end

  def translated_attribute(object, attribute, locale)
    if locale == 'pt-BR'
      object.send "#{attribute}_pt"
    else
      object.send "#{attribute}_es"
    end
  end
end
