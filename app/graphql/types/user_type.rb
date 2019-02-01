class Types::UserType < Types::BaseObject
  description "A User"

  field :id, ID, null: true
  field :email, String, null: true
  field :is_superadmin, Boolean, null: true, camelize: false

#   Schema is visible in the frontend only when the user is the current_user
  def self.visible?(context)
    !!context[:current_user]
  end
end 