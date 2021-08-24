class SamplesController < ApplicationController
  include BasicCrud

  def restricted_params
    params.require(:sample).permit([:name, :description])
  end
end
