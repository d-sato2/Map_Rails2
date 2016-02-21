class JapanController < ApplicationController
  def index
  end

  def japan_map
    data = File.read('db/japan_out.json')
    render json: data
  end

  def japan_value
    data = Japan.all
    render json: data.to_json(except: [:created_at, :updated_at])
  end
end
