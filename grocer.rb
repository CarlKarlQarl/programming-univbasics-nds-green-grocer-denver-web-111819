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
        temp_hash = cart[index]
        temp_hash[:count] = 1
        consolidated_cart.push(temp_hash)
      end
  end
  return consolidated_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  # REMEMBER: This method **should** update cart
  
  coupons.length.times do |index|
    if coupons[index][:item] == find_item_by_name_in_collection(coupons[index][:item], cart)[:item]
      cart.length.times do |inner_index|
        if cart[inner_index][:item] == coupons[index][:item] && cart[inner_index][:count] - coupons[index][:num] >= 0
          coupon_item = coupons[index][:item] + " W/COUPON"
          temp_hash = {
            :item => coupon_item,
            :price => (coupons[index][:cost] / coupons[index][:num]).round(3),
            :clearance => cart[inner_index][:clearance],
            :count => coupons[index][:num]
          }
          cart.push(temp_hash)
          
#          if cart[inner_index][:count] - coupons[index][:num] == 0
#            cart.delete_at(inner_index)
#          else
#            cart[inner_index][:count] -= coupons[index][:num]

          cart[inner_index][:count] -= coupons[index][:num]
          end
        end
      end
    end
  end
  return cart
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
