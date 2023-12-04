# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Product.delete_all

Product.create!([
  {
    name: "The Great Gatsby",
    description: "The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, the novel depicts narrator Nick Carraway's interactions with mysterious millionaire Jay Gatsby and Gatsby's obsession to reunite with his former lover, Daisy Buchanan.",
    image: "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781982146702/the-great-gatsby-9781982146702_hr.jpg",
    price: 12.99
  },
  {
    name: "The Catcher in the Rye",
    description: "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adults but is read by adolescents for its themes of angst, alienation, and as a critique on superficiality in society.",
    image: "https://m.media-amazon.com/images/I/71D6PnMg4WL._AC_UF1000,1000_QL80_.jpg",
    price: 11.99
  },
  {
    name: "The Grapes of Wrath",
    description: "The Grapes of Wrath is an American realist novel written by John Steinbeck and published in 1939. The book won the National Book Award and Pulitzer Prize for fiction, and it was cited prominently when Steinbeck was awarded the Nobel Prize in 1962.",
    image: "https://upload.wikimedia.org/wikipedia/commons/a/ad/The_Grapes_of_Wrath_%281939_1st_ed_cover%29.jpg",
    price: 10.99
  },
  {
    name: "The Sun Also Rises",
    description: "The Sun Also Rises is a 1926 novel by American writer Ernest Hemingway, his first, that portrays American and British expatriates who travel from Paris to the Festival of San Fermín in Pamplona to watch the running of the bulls and the bullfights.",
    image: "https://m.media-amazon.com/images/I/71O7XjXaMhL._AC_UF1000,1000_QL80_.jpg",
    price: 9.99
  }
])
