class List < ApplicationRecord
  belongs_to :board
  has_many :tasks

def self.all_lists(board_id, list_id)
  List.find_by_sql(
    "SELECT *
     FROM lists"
  )
end

def self.single_list(board_id)
  List.find_by_sql(["
    SELECT *
    FROM lists AS l
    WHERE l.id = ?", board_id]).first
end

def self.create_list(p, board_id)
  List.find_by_sql(["
  INSERT INTO lists (name, priority, board_id, created_at, updated_at)
  VALUES (:name, :priority, :board_id, :created_at, :updated_at)
  ", {
    name: p[:name],
    priority: p[:priority],
    board_id: board_id,
    created_at: DateTime.now,
    updated_at: DateTime.now
  }])
  end
end




