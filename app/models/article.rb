require "translit"

class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def to_param
    [id, Translit.convert(title, :english).downcase.gsub!(' ', '-')].join("-")
  end
end
