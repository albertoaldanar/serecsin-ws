class Stop < ApplicationRecord
  belongs_to :ruta, optional: true
end
