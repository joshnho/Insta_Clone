# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all
User.reset_pk_sequence
Post.reset_pk_sequence

user1 = User.create(name: "Brian", username: "brianwong")
user2 = User.create(name: "Josh", username: "joshnho")

Post.create(description: "brians first post", content: "Picture URL", user_id: user1.id)
Post.create(description: "brians second post", content: "Picture URL", user_id: user1.id)
Post.create(description: "brians third post", content: "Picture URL", user_id: user1.id)

Post.create(description: "joshs first post", content: "Picture URL", user_id: user2.id)
Post.create(description: "joshs second post", content: "Picture URL", user_id: user2.id)
Post.create(description: "joshs third post", content: "Picture URL", user_id: user2.id)