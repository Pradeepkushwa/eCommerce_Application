FactoryBot.define do
  factory :order do
    user_id         {1}
    order_number    {1234}
    total_mrp       {90.00}
    total_price     {100.00}
    discount        {20.00}
    tax             {2.00}
    payment_method  {"string"}
    address_id      {1}
    status          {1}
  end
end
