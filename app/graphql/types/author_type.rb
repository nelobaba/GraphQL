class Types::AuthorInputType < GraphQL::Schema::InputObject
  graphql_name "AuthorInputType"
  description "All the attributes for creating an author"

  argument :id, ID, required: false
  argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false
  argument :yob, Int, required: false, camelize: false
  argument :is_alive, Boolean, required: false, camelize: false
end

class Types::AuthorType < Types::BaseObject
  description "An Author"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :yob, Int, null: false
  field :is_alive, Boolean, null: true
  field :full_name, String, null: true, camelize: false

#   object here is Author
  def full_name
    ([object.first_name, object.last_name].compact).join " "
  end 

  field :coordinates, Types::CoordinatesType, null: false
  field :publication_years, [Int], null: false

  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.map { |e| {field_name: e, errors: object.errors[e] }}
  end
end 