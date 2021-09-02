
FactoryBot.define do
  factory :recipe do
    sequence(:title) { |n| "Title #{n}" }
    
    body { "For some stoves, especially electric stoves, it can take as long as 3 minutes to heat up to the right temperature!
      Once the pan is hot, then you can add your chicken. But make sure that you keep the chicken in a single layer and do not crowd. If you crowd the chicken, they will just steam and not sear in the pan.
      Another important tip to stir-fry is to have your meat at close to room temperature before cooking. This means leaving the chicken out to un-chill for about 15 minutes on the counter, which is the perfect amount of time for a short marinade." }
    ingredients { "MyString" }
    recommendations {0}
    user
  end
end
