require 'pp'

def find_item_by_name_in_collection(name, collection)
  #pp name
  #pp collection
  
  # Implement me first!
  #
  # Consult README for inputs and outputs
  
  row_index = 0
  
  while row_index < collection.length do
    if name === collection[row_index][:item]
   return collection[row_index]
    else
      nil
    end
    
    row_index += 1
  end
end

def consolidate_cart(cart)

  #pp cart

  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.

  unique_cart_items = []
  row_index = 0
  
  while row_index < cart.length do
    name = cart[row_index][:item]
    item = cart[row_index]
    already_in_cart = find_item_by_name_in_collection(name, unique_cart_items)
    
    if already_in_cart
      already_in_cart[:count] += 1
      
    else
      item[:count] = 1
      unique_cart_items.push(item)
    end
    row_index += 1
  end

  unique_cart_items

end

def make_coupons(coupons, cart)
  {
    :item => "#{coupons[:item]} W/COUPON",
    :price => (coupons[:cost]/coupons[:num]).round(3),
    :clearance => cart[:clearance],
    :count => coupons[:num]
  }
  
end

def apply_coupons(cart, coupons)

  pp cart
  pp coupons

  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  updated_cart = cart
  row_index = 0
  while row_index < coupons.length do
    coupon_item = coupons[row_index][:item]
    coupon_num = coupons[row_index][:num]
    coupon_cost = coupons[row_index][:cost]
    find_coupon_item = find_item_by_name_in_collection(coupons[:item], cart)
    cart_item = cart[row_index][:item]
    cart_count = cart[row_index][:count]
    p "hello"
    if cart_item  === find_coupon_item && cart_count > coupon_num

      updated_cart[row_index][:count] -= coupon_num
      updated_cart.push(make_coupons(coupons, cart))
    end
      
    if cart_item  === find_coupon_item && cart_count = coupon_num
      updated_cart.slice!(row_index)
      updated_cart.push(make_coupons(coupons, cart))
    end
    
    row_index += 1
  end
  
  updated_cart

end

def apply_clearance(cart)
  #pp cart
 
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
=begin   
  updated_cart = []
  row_index = 0
  
  while row_index < cart.length do
    item = cart[row_index]
    
    if item[:clearance]
      item[:price] = (.8 * item[:price]).round(3) #=>20% discount
    end
    
    row_index += 1
  end
  
  updated_cart
=end
end

def checkout(cart, coupons)
  #pp cart
  #pp coupons
  
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
=begin
  grand_total = 0
  row_index = 0
  
  final_cart = consolidate_cart(cart)
  final_cart
  apply_coupons(final_cart, coupons)
  apply_clearance(final_cart)
  
  while row_index < final_cart.length do
    grand_total += (final_cart[row_index][:count] * final_cart[row_index][:price])
    row_index += 1
  end
    
  if grand_total > 100
    grand_total = (grand_total * .9) #=>10% discount
  end
    
  grand_total
=end
end
