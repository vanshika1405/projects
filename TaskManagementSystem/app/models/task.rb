class Task < ApplicationRecord
    enum status: { pending: 0, completed: 1 }
  end
  