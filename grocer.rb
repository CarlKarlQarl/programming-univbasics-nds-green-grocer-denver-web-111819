def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  # Consult README for inputs and outputs
  
  collection.length.times do |index|
    if collection[index][:item] == name
      return collection[index]
    end
  end
  return nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  consolidated_cart = []
  
  cart.length.times do |index|
      if cart[index] == find_item_by_name_in_collection(cart[index][:item], consolidated_cart)
        consolidated_cart.length.times do |inner_index|
          if cart[index][:item] == consolidated_cart[inner_index][:item]
            consolidated_cart[inner_index][:count] += 1
          end
        end
      else
        consolidated_cart.push(cart[index])
      end
  end
  return consolidated_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
