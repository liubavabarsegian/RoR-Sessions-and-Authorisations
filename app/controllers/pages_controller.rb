# frozen_string_literal: true

# class PagesController
class PagesController < ApplicationController
  include PagesHelper
  def form; end

  def output
    @new_elem = Mersenne.new(mersenne_params)
    unless @new_elem.valid?
      flash[:error] = 'Your stupid ass entered a non-positive value'
      redirect_to form_path
      nil
    end

    @input = params[:num].to_i
    if find_n(@input)
      @result_m = find_n(@input).result.split(' ')
      @count = find_n(@input).count
      logger.debug "HERE IS THE RESULT VALUE: #{find_n(params[:num].to_i).result}"
      logger.debug "HERE IS THE RESULT CLASS: #{find_n(params[:num].to_i).result.class}"
    else
      @result_m = mersenne_to_n(@input)
      add_to_db(@input, @result_m)
    end
  end

  def db_to_xml
    render xml: Mersenne.last(15)
  end

  private

  def mersenne_params
    params.permit(:num)
  end
end
