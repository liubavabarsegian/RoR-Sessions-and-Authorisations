class UserSerializer < ActiveModel::Serializer
  attributes :id, :nick, :email, :password
end
