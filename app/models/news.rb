class News < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :title_pt, presence: true
  validates :title_es, presence: true
  validates :text_pt, presence: true
  validates :text_es, presence: true

  def self.locale_attribute_name(attribute, locale)
    if locale == 'pt-BR'
      "#{attribute}_pt".to_sym
    else
      "#{attribute}_es".to_sym
    end
  end

  def translated_attribute(attribute, locale)
    if locale == 'pt-BR'
      self.send "#{attribute}_pt"
    else
      self.send "#{attribute}_es"
    end
  end
end
