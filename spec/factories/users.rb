FactoryBot.define do
  factory :user do
    first_name {"string"}
    last_name {"string"}
    email {"string@gmail.com"}  
    phone {67656675675}
    password {"string"}
    password_confirmation {"string"}
    
  end
end
