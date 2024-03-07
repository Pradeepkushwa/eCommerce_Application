FactoryBot.define do
  factory :address do
   street_address {"string_address"}
   state          {"string_state"}             
   city           {"string_city"}
   zip_code       {123456}
   user_id         {1}
 end
end
