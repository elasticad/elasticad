# encoding: utf-8

FactoryGirl.define do
  factory :address, class: Elasticad::Address do
    addresses ['123 Fake Street', 'abc Mock Street']
    type      :commercial

    factory :built_address_child do
      after(:build) do |address|
        address.phones.build(attributes_for(:phone_document))
        address.emails.build(attributes_for(:email_document))
      end
    end
  end
end
