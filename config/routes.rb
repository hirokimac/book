Rails.application.routes.draw do
  get "books/new"
  get "books" => "books#index"
  post "books" => "books#create"
  get "books/:id/edit" => "books#edit" , as: "edit_book"
  get "books/:id" => "books#show" , as: "book"
  patch "books/:id" => "books#update"
  put "books/:id" => "books#update"
  delete "books/:id" => "books#destroy" , as: "destroy_book"
end