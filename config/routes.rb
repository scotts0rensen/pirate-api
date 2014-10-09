PirateApi::Application.routes.draw do
  post 'translate', to: 'translation#translate', as: :translate
end
