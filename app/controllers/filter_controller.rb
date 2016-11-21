class postfilterController < ApplicationController

  def index
    @filterrific = initialize_filterrific(
      postfilter,
      params[:filterrific],
      :select_options => {
        sorted_by: postfilter.options_for_sorted_by,
        with_category_id: category.options_for_select
      }
    ) or return
    @postfilter = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

end
