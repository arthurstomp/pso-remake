require File.join(File.dirname(__FILE__),'pso_binary')

class PSO_Binary_Type1 < PSO_Binary
  def new_velocity(former_velocity_i, p_best_position_i, p_position_i, g_best_position_i)
    phis = random_factor
    phi1 = phis[0]
    phi2 = phis[1]
    phi = phi1 + phi2
    p = (phi1*p_position_i + phi2*g_best_position_i)/phi

    k = range(0.0, 4.5)
    aux = 2 - phi - Math.sqrt((phi**2) - (4*phi))
    aux *= -1 if aux < 0
    big_x = (2*k) / aux
    
    aux_velocity = former_velocity_i + phi*(p - p_position_i)

    new_velocity = big_x*(aux_velocity)
  end
end
