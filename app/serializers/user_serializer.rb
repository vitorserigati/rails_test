class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :middle_name, :last_name, :cpf, :email

  has_one :wallet
end
