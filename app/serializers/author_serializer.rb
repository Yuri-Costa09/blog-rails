class AuthorSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email
end
