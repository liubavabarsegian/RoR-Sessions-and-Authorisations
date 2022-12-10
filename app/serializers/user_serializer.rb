# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :nick, :email, :password
end
