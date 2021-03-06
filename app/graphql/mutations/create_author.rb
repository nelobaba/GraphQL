class Mutations::CreateAuthor < GraphQL::Schema::Mutation
    null true
    argument :first_name, String, required: false, camelize: false
    argument :last_name, String, required: false, camelize: false
    argument :yob, Int, required: false, camelize: false
    argument :is_alive, Boolean, required: false, camelize: false

    def resolve(first_name:, last_name:, yob:, is_alive:)
        Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
    end

    # Only super admins can create an author
    def self.accessible?(context)
        context[:current_user]&.is_superadmin?
    end
end