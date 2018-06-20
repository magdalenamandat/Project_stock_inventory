require('pry')
require_relative('../models/manufacturer')
require_relative('../models/group')
require_relative('../models/item')

Item.delete_all()
Manufacturer.delete_all()
Group.delete_all()


manufacturer1 = Manufacturer.new({
  'name' => 'Biona',
  'email_address' => 'biona@gmail.com'
  })
manufacturer2 = Manufacturer.new({
  'name' => 'Suma',
  'email_address' => 'suma@gmail.com'
  })
manufacturer3 = Manufacturer.new({
  'name' => 'Tetley',
  'email_address' => 'tetley@gmail.com'
  })

  manufacturer1.save()
  manufacturer2.save()
  manufacturer3.save()

group1 = Group.new({
  'name' => 'food & drinks'
  })
group2 = Group.new({
  'name' => 'supplements'
  })
group3 = Group.new({
  'name' => 'tests'
  })

  group1.save()
  group2.save()
  group3.save()

item1 = Item.new({
  'name' => 'pesto',
  'price' => '3.00',
  'group_id' => group1.id,
  'manufacturer_id' => manufacturer1.id,
  'sell_price' => '4.00',
  'quantity' => '40'
  })

item2 = Item.new({
  'name' => 'brown pasta',
  'price' => '4.00',
  'group_id' => group1.id,
  'manufacturer_id' => manufacturer2.id,
  'sell_price' => '5.00',
  'quantity' => '20'
  })

# item3 = Item.new({
#   'name' => 'Camomile tea',
#   'price' => '2.00',
#   'group_id' => group1.id,
#   'manufacturer_id' => manufacturer3.id,
#   'sell_price' => '3.00',
#   'quantity' => '5'
#    })

   item1.save()
   item2.save()
   item3.save()


  binding.pry
  nil
