class User::UsersController < ApplicationController
  has_many :bookmarks, dependent: :destroy
end
