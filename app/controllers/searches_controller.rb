require 'search'

class SearchesController < ApplicationController

  # Dynamic Search Page using pure JavaScript JSON RESTful API
  def dynamic
    render :dynamic
  end

  # /search/
  def new
  end

  # results: /search/foo
  def results
    @title = 'Search'
    @tagnames = params[:q].split(',')
    @users = SearchService.new.users(params[:q])
    @nodes = TypeaheadService.new.nodes(params[:q], 100, params[:order].to_s.to_sym)
      .paginate(page: params[:page], per_page: 24)
  end

end
