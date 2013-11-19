Rails.application.routes.draw do

  mount Elasticad::Core::Engine => "/elasticad"
end
