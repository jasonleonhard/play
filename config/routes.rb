Rails.application.routes.draw do
  root 'bot#hello'
  get 'bot/hello'
  get 'bot/goodbye'
end
