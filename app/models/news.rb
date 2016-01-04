class News < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments, as: :commentable

  validates :user_id, presence: true
  validates :title_pt, presence: true
  validates :title_es, presence: true
  validates :text_pt, presence: true
  validates :text_es, presence: true

  accepts_nested_attributes_for :comments

  def set_tags(locale, names)
    stripped_names = names.split(",").map{ |name| name.strip }
    new_tags = stripped_names.map do |name|
      Tag.where(name: name, locale: locale).first_or_create!
    end
    self.tags.where(locale: locale).each do |tag|
      self.taggings.where(tag: tag).destroy_all unless tag.name.in?(stripped_names)
    end
    self.tags += new_tags
  end

  def get_tag_names(locale)
    self.tags.where(locale: locale).map(&:name).join(", ")
  end

  def all_tags_pt=(names)
    set_tags('pt-BR', names)
  end

  def all_tags_pt
    get_tag_names('pt-BR')
  end

  def all_tags_es=(names)
    set_tags('es-AR', names)
  end

  def all_tags_es
    get_tag_names('es-AR')
  end
end
