module Types
  class MutationType < Types::BaseObject
    # Create an Author
    field :create_author, AuthorType, null: true, description: "Create an author" do
      argument :author, Types::AuthorInputType, required: true
    end

    def create_author(author:)
      Author.create author.to_h
    end

    # OR use delegation like this

    # field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor

    field :update_author, Boolean, null: false, description: "Update an author" do
      argument :author, Types::AuthorInputType, required: true
    end

    def update_author(author:)
      existing = Author.where(id: author[:id]).first
      existing&.update author.to_h
    end

    field :delete_author, Boolean, null: false, description: "Delete an author" do
      argument :id, ID, required: true
    end

    def delete_author(id:)
      Author.where(id: id).delete_all
      true
    end
  end
end
