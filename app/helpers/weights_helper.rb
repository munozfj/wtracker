module WeightsHelper
  def fat_weight(weight)
    if ! weight.fat_porcentage.blank?
      number_with_precision((weight.fat_porcentage * weight.weight)/100, precision: 2)
    end
  end

  def bmi(weight)
    number_with_precision(weight.weight/(1.70**2), precision: 2)
  end

  def benedict(weight)
    0
  end
end
