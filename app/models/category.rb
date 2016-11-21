class Category < ActiveRecord::Base

  has_many :postfilter, :dependent => :nullify

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end

end
