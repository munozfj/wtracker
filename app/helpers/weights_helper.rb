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
    number_with_precision(bmr(weight,user)*user.profile.activity_level.to_f, precision:0)
  end


=begin

function bmi(peso, altura)
{
  return (peso/(altura*altura))
}


function bmi_max(altura)
{
  return 25*altura*altura
}

function bmi_min(altura)
{
  return 18.5*altura*altura
}

function bmi_category(valor) 
{
  
if (valor < 15 )
    return "Muy severo bajo peso";
else if (valor >= 15 && valor < 16)
    return "Severo bajo peso";
else if (valor >= 16 && valor < 18.5)
    return "Bajo peso";
else if (valor >= 18.5 && valor < 25) 
    return "Normal";
else if ( valor >= 25 && valor < 30)
    return "Sobrepeso";
else if (valor >= 30 && valor < 35 ) 
    return "Obesidad Clase I";
else if (valor >= 35 && valor < 40 )
    return "Obesidad Clase II";
else
    return "Obesidad Clase III";
}

function bmr(peso, altura, anios) 
{
   return 66 + ( 13.7 * peso ) + ( 5 * altura * 100 ) - ( 6.8 * anios )
}

function harris_benedict(peso, altura, anios,actividad) 
{
   if (actividad = "Poco o nada de ejercicio")
     return bmr(peso,altura,anios)*1.2;
   else if (actividad = "Algo de ejercicio/deporte 1-3 veces por semana")
       return bmr(peso,altura,anios)*1.375;
   else if (actividad = "Moderado ejercicio/deporte 3-5 veces por semana")
       return bmr(peso,altura,anios)*1.55;
   else if (actividad = "Bastante ejercicio/deporte 6-7 veces por semana")
       return bmr(peso,altura,anios)*1.725;
   else
     return  bmr(peso,altura,anios)*1.9;
}

=end




end
