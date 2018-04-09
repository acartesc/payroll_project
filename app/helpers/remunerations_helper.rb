module RemunerationsHelper

  def months_to_string(number)
    case number
      when 1 then "Enero"
      when 2 then "Febrero"
      when 3 then "Marzo"
      when 4 then "Abril"
      when 5 then "Mayo"
      when 6 then "Junio"
      when 7 then "Julio"
      when 8 then "Agosto"
      when 9 then "Septiembre"
      when 10 then "Octubre"
      when 11 then "Noviembre"
      when 12 then "Diciembre"
    end
  end

end
