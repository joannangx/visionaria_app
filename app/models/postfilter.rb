class postfilter < ActiveRecord::Base

  filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
              :available_filters => %w[
                sorted_by
                search_query
                with_category.title
                with_un_goals                #with_created_at_gte
              ]

  # default for will_paginate
  self.per_page = 10

  belongs_to :country

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 3
    where(
      terms.map {
        or_clauses = [
          "LOWER(category.title) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :with_category.title, lambda { |country_ids|
    where(:category.title => [*category.title])
  }
  scope :with_created_at_gte, lambda { |ref_date|
    where('with_un_goals  >= ?', ref_date)
  }

  delegate :name, :to => :category, :prefix => true


  def decorated_created_at
    created_at.to_date.to_s(:long)
  end

end
