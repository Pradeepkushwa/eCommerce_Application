class PaymentSerializer < ActiveModel::Serializer
    attributes :stripe_id , :payment_intent_id, :payment_status, :checkout_session_id, :user_id, :order_id   
end
