class SendDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1日~2日で発送' },
    { id: 3, name: '2日~3日」で発送' },
    { id: 3, name: '4日~7日で発送' },
  ]

  include ActiveHash::Associations
  has_many :products
  
  end