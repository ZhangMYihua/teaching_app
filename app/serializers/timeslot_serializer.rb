class TimeslotSerializer < ActiveModel::Serializer
  attributes :id, :start, :end, :description

  def description
  	"Yolo"
  end

  def start
  	object.start_time
  end

  def end
  	object.end_time
  end
end
