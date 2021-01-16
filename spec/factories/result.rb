FactoryBot.define do
  factory :result do
    victory { 2 }
    card1 { "diamond/1.png" }
    card2 { "diamond/2.png" }
    card3 { "diamond/3.png" }
    card4 { "diamond/4.png" }
    card5 { "diamond/5.png" }
    rank { 5 }
  end
end
