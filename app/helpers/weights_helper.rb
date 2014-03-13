module WeightsHelper
  def fat_weight(weight)
    if ! weight.fat_porcentage.blank?
      number_with_precision((weight.fat_porcentage * weight.weight)/100, precision: 2)
    end
  end

  def bmi(weight,user)
    number_with_precision(weight.weight/(user.profile.height**2), precision: 2)
  end

  def bmr(weight,user)
   66 + ( 13.7 * weight.weight ) + ( 5 * user.profile.height * 100 ) - ( 6.8 * age(user) )
  end

  def age(user)
     (Time.now.to_s(:number).to_i - user.profile.date_birth.to_time.to_s(:number).to_i)/10e9.to_i 
  end

  def harry_benedict(weight,user)
    number_with_precision(bmr(weight,user)*user.profile.activity_type.to_f, precision:0)
  end
end
