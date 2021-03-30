
market_items = {
  'croissants' => {
    price: 75, 
    quantity: 150
    },
  'pain au chocolat' => {
    price: 150, 
    quantity: 80
    },
  'frommage frais' => {
    price: 400, 
    quantity: 50
    },
  'pears' => {
    price: 100, 
    quantity: 100
    },
  'cafe au lait' => {
    price: 350, 
    quantity: 50
    },
  'cafe noir' => {
    price: 300, 
    quantity: 200
    },
  'apples' => {
    price: 500, 
    quantity: 75
    }
}

shopping_cart = {}
quit = false

#listing items
puts "Welcome to Le Wagon Farmer's Market!"
puts "*****"*7
puts "Our Inventory"
market_items.each { |food_name,sym| 
  puts "#{food_name.capitalize}, Price: ¥#{market_items[food_name][:price]}, Quantity: #{market_items[food_name][:quantity]}"}
puts "*****"*7


#start main loop here
until quit #ie until quit assigned true 
  puts 'What would you like to buy?'
  item = gets.chomp
  if market_items.key?(item)
    # ask user for quantity
    puts "How many do you want?"
    quantity = gets.chomp.to_i
    #checks there is enough of requested item. 
    if quantity <= market_items[item][:quantity]
      market_items[item][:quantity] = market_items[item][:quantity] - quantity
      #creates item if nil(not in hash), adds to item quantity if already in hash
      if shopping_cart[item] == nil
        shopping_cart[item] = quantity
      else
        shopping_cart[item] = shopping_cart[item] + quantity
      end
      puts "#{quantity} #{item} added to your cart."
      puts "#{market_items[item][:quantity]} #{item} remaining"
    else
      #adds the remaining quantity, even if zero
      puts "Sorry we don't have enought of that item."
      quantity = market_items[item][:quantity]
      #copy and paste of above code... would be good to turn this into a method.
      market_items[item][:quantity] = market_items[item][:quantity] - quantity
      #creates item if nil(not in hash), adds to item quantity if already in hash
      if shopping_cart[item] == nil
        shopping_cart[item] = quantity
      else
        shopping_cart[item] = shopping_cart[item] + quantity
      end
      puts "#{quantity} #{item} added to your cart."
      puts "#{market_items[item][:quantity]} #{item} remaining"
    end
  else
    puts "We don't have that item... 😢"
    end
  puts "Is that all? [yes]/[no]"
  answer = gets.chomp.downcase
  if answer == "yes"
    quit = true
  else
    quit = false 
  end
end
# loop ends here



# prints bill
puts '****BILL****'
shopping_cart.each do |item, cart_quantity|
  price = market_items[item][:price] * cart_quantity
  puts "#{item} x #{cart_quantity} = ¥#{price}"
end
puts '************'
