require('pry')
require_relative('../models/item')
require_relative('../models/manufacturer')
require_relative('../models/group')


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
  'name' => 'pasta sauces'
  })
group2 = Group.new({
  'name' => 'pastas'
  })
group3 = Group.new({
  'name' => 'teas'
  })

  group1.save()
  group2.save()
  group3.save()

item1 = Item.new({
  'name' => 'pesto',
  'price' => 3.00,
  'group_id' => group1.id,
  'manufacturer_id' => manufacturer1.id,
  'profit' => 0.5,
  'sell_price' => 3.50,
  'quantity' => 40,
  'stock_level' => 'stock-green'
  })

item2 = Item.new({
  'name' => 'brown pasta',
  'price' => 4.00,
  'group_id' => group2.id,
  'manufacturer_id' => manufacturer2.id,
  'profit' => 0.5,
  'sell_price' => 4.50,
  'quantity' => 20,
  'stock_level' => 'stock-orange'
  })

item1 = Item.new({
  'name' => 'Camomile tea',
  'price' => 2.00,
  'group_id' => group3.id,
  'manufacturer_id' => manufacturer3.id,
  'profit' => 0.5,
  'sell_price' => 2.50,
  'quantity' => 5,
  'stock_level' => 'stock-red'
   })

   item1.save()
   item2.save()
   item3.save()


  binding.pry
  nil
