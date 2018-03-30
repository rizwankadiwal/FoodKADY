require "administrate/field/base"

class PaperclipField < Administrate::Field::Base
  def to_s
    data
  end

  def url
    data.url
  end
end
