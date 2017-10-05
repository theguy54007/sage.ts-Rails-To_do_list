class Task < ApplicationRecord
  validates_presence_of :name, :due_date, :description
end
