class Project < ApplicationRecord
    #하나의 프로젝트는 여러사람이 조인 할 수 있다.
    has_many :user_projects
    has_many :user, through: :user_projects
    #하나의 프로젝트에는 여러 코맨트가 달릴 수 있다.
    has_many :project_comments
    #하나의 프로젝트에는 여러개의 스킬셋이 존재할 수 있다.
    has_many :project_skills
    has_many :skills , through: :project_skills
    #하나의 프로젝트에는 여러개의 카테고리가 존재할 수 있다.
    has_many :project_categories
    has_many :categories,  through: :project_categories
    
end
