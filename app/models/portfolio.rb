class Portfolio < ApplicationRecord
    #하나의 포트폴리오는 한명의 유저에게 속한다.
    belongs_to :user
end
