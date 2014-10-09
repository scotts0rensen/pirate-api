PirateApi::Application.routes.draw do
  post 'translate', to: 'translation#translate', as: :translate
  get 'translation', to: 'translation#translation', as: :translation
end
