class ExamplesController < ApplicationController
  def show
    @example = Example.find(params[:id])
  end
end
